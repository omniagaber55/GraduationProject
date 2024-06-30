import 'package:app/Components/Notification.dart';
import 'package:app/veiws/ForYou.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/Components/WaveAnimation.dart';
import 'package:app/Components/WifiSwitch.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/Components/WaveAnimation.dart';
import 'package:app/Components/WifiSwitch.dart';
import 'package:app/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MqttServerClient client;
  String sensorValue = 'No data';
  int notificationCount = 0; // State to keep track of notification count

  @override
  void initState() {
    super.initState();

    // Initialize MQTT client
    client = MqttServerClient('test.mosquitto.org', '');
    client.port = 1883; // Default MQTT port
    client.keepAlivePeriod = 30; // Keep alive period in seconds

    // Set client identifier
    client.clientIdentifier = 'lens_DQOvLIayWcxG1GLHIyNWLXtL7sg';

    _connect(); // Connect to MQTT broker
  }

  void _connect() async {
    try {
      await client.connect();
      print('Connected to MQTT broker');

      // Subscribe to sensor data topic
      _subscribeToSensorData('device/mq4'); // Replace with your sensor data topic
    } catch (e) {
      print('Connection failed: $e');
      // Handle connection failure gracefully
    }
  }

  void _subscribeToSensorData(String topic) {
    if (client != null && client.connectionStatus!.state == MqttConnectionState.connected) {
      client.subscribe(topic, MqttQos.atMostOnce);
      print('Subscribed to topic: $topic');

      // Listen to incoming messages
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>>? c) {
        final MqttPublishMessage message = c![0].payload as MqttPublishMessage;
        final payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print('Received message: $payload from topic: ${c[0].topic}');

        // Update sensor value in UI
        setState(() {
          sensorValue = payload;
        });
      }, onError: (e) {
        print('Error receiving message: $e');
        // Handle message receiving error
      });
    } else {
      print('Client is not connected');
      // Handle case where client is not connected before subscribing
    }
  }

  void _sendMqttMessage(String message, String topic) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message); // Add your message as string

    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    print('Sent MQTT message: $message to topic: $topic');
  }

  void _controlServo(bool value) {
    if (value) {
      _sendMqttMessage('1', 'device/servo'); // Send MQTT message 'SERVO_ON' to control servo
    } else {
      _sendMqttMessage('0', 'device/servo'); // Send MQTT message 'SERVO_OFF' to control servo
    }
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  Color.fromARGB(255, 21, 158, 146).withOpacity(.5),
                  Color.fromARGB(255, 21, 158, 146).withOpacity(0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: PrimaryColor,
                      size: 26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: WaveAnimation(),
                        ),
                        Text(
                          "$sensorValue L",
                          style: const TextStyle(
                            color: PrimaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notifications(),
                            ),
                          );

                          // Handle result from Notifications screen
                          if (result != null && result is int) {
                            setState(() {
                              // Update notification count based on result
                              notificationCount += result;
                            });
                          }
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/icons/clarity_notification-solid-badged.png",
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '$notificationCount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Switch ON/OFF Gas",
            style: TextStyle(
              color: PrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SwitchOn_Off(
            status: false,
            activeIcon: CupertinoIcons.flame, // Example of using a Cupertino icon
            inactiveIcon: CupertinoIcons.flame_fill,
            onToggle: _controlServo,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Switch ON/OFF Electric",
            style: TextStyle(
              color: PrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SwitchOn_Off(
            status: false,
            activeIcon: Icons.bolt_outlined,
            inactiveIcon: Icons.bolt_outlined,
            onToggle: (value) {
              if (value) {
                _sendMqttMessage('1', 'device/servo'); // Example: Send MQTT message 'ELECTRIC_ON'
              } else {
                _sendMqttMessage('0', 'device/servo'); // Example: Send MQTT message 'ELECTRIC_OFF'
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                       ForyouDevice(), // Navigate to SignUpAsBuyer for Buyer
                  ),
                );
              },
              child: Container(
                height: 55,
                width: 348,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: PrimaryColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 29.67,
                      height: 29.67,
                      image: AssetImage(
                        'assets/images/foryou.png',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "For You",
                      style: TextStyle(
                          fontSize: 24,
                          color: White,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
