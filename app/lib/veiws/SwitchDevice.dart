import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Components/CustomButtom.dart';
import 'package:app/veiws/ConrolAnotherDevice.dart';
import 'package:app/veiws/ScanQR_Code.dart';
import 'package:app/veiws/UpdateEmail.dart';

class SwitchDevice extends StatefulWidget {
  const SwitchDevice({super.key});

  @override
  State<SwitchDevice> createState() => _SwitchDeviceState();
}

class _SwitchDeviceState extends State<SwitchDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: PrimaryColor,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Image.asset("assets/icons/Group 127.png"),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "rshawky@mail.com", // Display user email
                            style: TextStyle(
                              color: White,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmailUpdateScreen(), // Navigate to EmailUpdateScreen
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: White,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                    color: White,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 250),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                color: White,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 47),
                    child: Row(
                      children: [
                        const Text(
                          "Switch Device",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 35),
                        TextButton(
                          onPressed: () {
                            // Action for "Done" button
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: PrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Controlling_device(), // Navigate to Controlling_device
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/icons/Group 132.png"),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Device",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: PrimaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 135),
                          Image.asset("assets/icons/Vector (1).png"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  CustomButton(
                    label: "Add New Device",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScanQRCode(), // Navigate to ScanQRCode
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
