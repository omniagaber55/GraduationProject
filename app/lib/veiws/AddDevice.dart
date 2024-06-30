import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomFeild.dart';
import 'package:app/veiws/ForYou.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/constants.dart';

import 'package:app/components/PickerDevice.dart'; // Adjust import path as per your project structure

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  int selectedDevice = 0; // Default device consumption

  Future<void> _postData() async {
    String name = nameController.text.trim();
    String brand = brandController.text.trim();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 33|TsM4ZeboAzmCEFgcKC0DIwNLPJhxUrydQ9b6qv5I0dd7dfae', // Replace with your actual token
    };

    var url = Uri.parse('https://9a32-197-43-150-8.ngrok-free.app/api/add-device');
    var response = await http.post(
      url,
      headers: headers,
      body: {
        'device_name': name,
        'device_brand': brand,
        'device_consumption': selectedDevice.toString(),
      },
    );

    if (response.statusCode == 200) {
      print('Device added successfully');
      print(response.body);
      // Navigate to another screen upon successful addition (optional)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForyouDevice(), // Replace with your desired destination
        ),
      );
    } else {
      print('Failed to add device. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: PrimaryColor,
            size: 26,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(235, 248, 248, 248),
        title: const Text(
          "Add Device",
          style: TextStyle(color: PrimaryColor, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomFiled(
                  labelText: "Device Name",
                  controller: nameController,
                ),
              ),
              const SizedBox(height: 35),
              CustomFiled(
                labelText: "Device Brand",
                controller: brandController,
              ),
              const SizedBox(height: 30),
              PickerDevice(
                onDeviceSelected: (selectedDevice) {
                  setState(() {
                    this.selectedDevice = selectedDevice;
                  });
                },
              ),
              const SizedBox(height: 45),
            CustomButton(onTap: _postData, label: "Add"),
            CustomButton(  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                           AddDevice(), // Navigate to SignUpAsBuyer for Buyer
                      ),
                    );
                  }, label: "Add Another One"),
              
            ],
          ),
        ),
      ),
    );
  }
}
