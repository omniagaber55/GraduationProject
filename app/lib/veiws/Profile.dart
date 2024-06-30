import 'package:app/Components/AlertDiallog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/veiws/Login.dart';  // Adjust import based on your login screen
import 'package:app/constants.dart';
import 'package:app/Components/ProfileItem.dart';
import 'package:app/veiws/ResetYourPassword.dart';
import 'package:app/veiws/UpdateEmail.dart';
import 'package:app/veiws/switchDevice.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> logoutUser() async {
    var url = Uri.parse('https://your-backend-api.com/logout');  // Replace with your logout endpoint

    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer your_access_token',  // Replace with your actual bearer token
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LogIn_Screen()),  // Navigate to login screen
          (route) => false,  // Remove all existing routes
        );
      } else {
        // Handle other status codes or errors
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout Failed'),
              content: Text('Failed to logout. Status code: ${response.statusCode}'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle network errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred. Please check your internet connection and try again.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                        builder: (context) => const EmailUpdateScreen(),
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
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.only(left: 28, right: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(
              children: [
                Column(
                  children: [
                    Profile_item(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Reset_Password(),
                          ),
                        );
                      },
                      text: "Reset Password",
                      image1: "assets/icons/arcticons_passwordgenerator.png",
                    ),
                     Profile_item(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SwitchDevice(),
                          ),
                        );
                      },
                      text:  "Switch Device  ",
                      image1: "assets/icons/Vector.png",
                    ),
                     Profile_item(
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebView(),
                          ),
                        );
                      },
                      text:"Help                ",
                      image1: "assets/icons/clarity_help-info-solid.png",
                    ),
                    Profile_item(
                      tap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LogoutAlertDialog(
                              onConfirm: () {
                                Navigator.pop(context); // Close the dialog
                                logoutUser(); // Call the logout function
                              },
                            );
                          },
                        );
                      },
                      text: "Log Out          ",
                      image1: "assets/icons/solar_logout-3-linear.png",
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
