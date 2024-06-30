import 'package:app/Components/BottomNavBar.dart';
import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/WifiSwitch.dart';

import 'package:app/constants.dart';
import 'package:app/veiws/Home.dart';

import 'package:flutter/material.dart'; // Flutter material library

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 13, top: 35),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Welcome To Biovoltex",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: PrimaryColor,
                ),
              ),
              const SizedBox(height: 55),
              const Text(
                "In order to control the device, you must \nfirst turn on Wi-Fi or Bluetooth or both .",
                style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              const SwitchOn_Off(
                status: false,
                activeIcon: Icons.wifi,
                inactiveIcon: Icons.wifi,
              ),
              const SizedBox(height: 25),
              const SwitchOn_Off(
                status: false,
                activeIcon: Icons.bluetooth_outlined,
                inactiveIcon: Icons.bluetooth_outlined,
              ),
              const SizedBox(height: 45),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
                label: "Done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
