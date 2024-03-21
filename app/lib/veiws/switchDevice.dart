import 'package:app/Components/custom_button.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/Update_email.dart';
import 'package:app/veiws/control_another_device.dart';
import 'package:flutter/material.dart';

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
                          const SizedBox(
                            height: 100,
                          ),
                          Image.asset("assets/icons/Group 127.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "rshawky@mail.com",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Update_email(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(16)),
                        color: Colors.white),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 250),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Colors.white),
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
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: PrimaryColor),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
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
                                color: PrimaryColor),
                          ),
                        ),
                        const SizedBox(
                          width: 135,
                        ),
                        Image.asset("assets/icons/Vector (1).png")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  customButton(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Controlling_device(),
                          ),
                        );
                      },
                      text: "Add New Device")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
