import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomFeild.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/constants.dart';

import 'package:app/components/PickerDevice.dart'; // Adjust import path as per your project structure

class EditDeviceAdd extends StatefulWidget {
  const EditDeviceAdd({Key? key}) : super(key: key);

  @override
  State<EditDeviceAdd> createState() => _EditDeviceAddState();
}

class _EditDeviceAddState extends State<EditDeviceAdd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  int selectedDevice = 0; // Initialize with a default value if needed

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer 33|TsM4ZeboAzmCEFgcKC0DIwNLPJhxUrydQ9b6qv5I0dd7dfae', // Replace with your actual token
  };

 Future<void> _postData() async {
  String name = nameController.text.trim();
  String brand = brandController.text.trim();

  // Print the data before posting
  print('Device Name: $name');
  print('Device Brand: $brand');
  print('Selected Device: $selectedDevice');

  try {
    final response = await http.post(
      Uri.parse('https://9a32-197-43-150-8.ngrok-free.app/api/update-device?id=16'), // Replace with your actual API URL
      headers: headers,
      body: {
        'device_name': name,
        'device_brand': brand,
        'device_consumption': selectedDevice.toString(),
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Device updated successfully');
      // Optionally, navigate back to the previous screen or perform other actions upon successful update
      Navigator.pop(context); // Navigate back to the previous screen
    } else {
      print('Failed to update device. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Exception occurred: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(235, 248, 248, 248),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit_square, color: PrimaryColor),
                SizedBox(width: 10),
                Text(
                  "Edit Device",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomFiled(
              labelText: "Device Name",
              controller: nameController,
            ),
            const SizedBox(height: 20),
              CustomFiled(
              labelText: "Device Brand",
              controller: brandController,
            ),
            const SizedBox(height: 40),
            PickerDevice(
              onDeviceSelected: (selectedDevice) {
                setState(() {
                  this.selectedDevice = selectedDevice;
                });
              },
            ),
            const SizedBox(height: 30),
           CustomButton(onTap: _postData, label: "Done"),
          ],
        ),
      ),
    );
  }
}
