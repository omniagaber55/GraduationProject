import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomFeild.dart';

import 'package:app/veiws/SplashForBuyer.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/Components/CustomEmail.dart';

import 'package:app/Components/CustomPassword.dart';
import 'package:app/constants.dart';

class SignUp_Buyer extends StatefulWidget {
  const SignUp_Buyer({super.key});

  @override
  _SignUp_BuyerState createState() => _SignUp_BuyerState();
}

class _SignUp_BuyerState extends State<SignUp_Buyer> {
  // Controllers for text input fields
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State variable to toggle password visibility
  bool eye = true;

  // GlobalKey for the form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _postData() async {
    // Extracting values from text controllers
    String name = nameController.text;
    String address = addressController.text;
    String email = emailController.text;
    String password = passwordController.text;
    // Define headers
    var headers = {
      'Accept': 'application/json',
    };

    try {
      // Sending POST request to a placeholder API endpoint
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {
          'name': name,
          'address': address,
          'email': email,
          'password': password,
        },
      );

      // Checking if data addition was successful
      if (response.statusCode == 201) {
        // Printing data after successful addition
        print('Data added successfully');
        print('Name: $name');
        print('Address: $address');
        print('email: $email');
        print('passsword: $password');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BuyerSplash(),
          ),
        );
      } else {
        // Printing error message if data addition failed
        print('Failed to add data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Printing exception message if an error occurred during the process
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                // Back button
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                    ],
                  ),
                ),
                const Text(
                  "Sign Up as Buyer",
                  style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Description
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Enter your data to enjoy using our store",
                            style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                // Sign-up form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name input field
                      CustomFiled(
                        labelText: "Name",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      // Address input field
                      CustomFiled(
                        labelText: "Address",
                        controller: addressController,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      // Email input field
                      CustomEmail(
                        label: "Email",
                        color1: PrimaryColor,
                        hintText: "exe@gmail.com",
                        onChanged: null,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      // Password input field
                      CustomPasswordField(
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      // Sign-up button
                      CustomButton(
                        onTap: _postData,
                        label: "Sign Up",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
