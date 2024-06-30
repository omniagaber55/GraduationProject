import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomFeild.dart';
import 'package:app/Components/pickerDevice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../constants.dart';

class EditDeviceAdd extends StatefulWidget {
  const EditDeviceAdd({super.key});

  @override
  State<EditDeviceAdd> createState() => _EditDeviceAddState();
}

class _EditDeviceAddState extends State<EditDeviceAdd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  int selectedDevice = 0; // Initialize with a default value if needed

  Future<void> _postData() async {
    String name = nameController.text;
    String brand = brandController.text;

    // Print the data before posting
    print('Device Name: $name');
    print('Device Brand: $brand');
    print('Selected Device: $selectedDevice');

    try {
      final response = await http.post(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts'), // Replace 'Your API URL here' with your actual API URL
        body: {
          'name': name,
          'brand': brand,
          'device':
              selectedDevice.toString(), // Convert selectedDevice to a String
        },
      );

      if (response.statusCode == 201) {
        print('Device added successfully');
      } else {
        print('Failed to add device. Status code: ${response.statusCode}');
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
        elevation: 0, backgroundColor: const Color.fromARGB(235, 248, 248, 248),
        // title: Icon(Icons.arrow_back,color:Color(0xff009589 ,)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_square, color: PrimaryColor),
              SizedBox(width: 10),
              Text(
                "Edit Device",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColor),
              )
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
          CustomButton(onTap: _postData, label: "Done")
        ]),
      ),
    );
  }
}
