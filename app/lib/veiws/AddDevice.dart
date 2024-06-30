import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomFeild.dart';
import 'package:app/veiws/ForYou.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/constants.dart';

import 'package:app/Components/PickerDevice.dart';


class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  int selectedDevice = 0;

  Future<void> _postData() async {
    String name = nameController.text;
    String brand = brandController.text;

    try {
      final response = await http.post(
        Uri.parse('https://3b3a-197-43-150-8.ngrok-free.app/api/add-device'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 33|TsM4ZeboAzmCEFgcKC0DIwNLPJhxUrydQ9b6qv5I0dd7dfae',
        },
        body: {
          'device_name': name,
          'device_brand': brand,
          'device_type': selectedDevice.toString(),
        },
      );

      if (response.statusCode == 201) {
        print('Device added successfully');
        print('Device Name: $name');
        print('Device Brand: $brand');
        print('Selected Device Type: $selectedDevice');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForyouDevice(),
          ),
        );
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_box_outlined, color: PrimaryColor),
                SizedBox(width: 10),
                Text(
                  "Add Device",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: PrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomFiled(
              labelText: "Device Name",
              controller: nameController,
            ),
            const SizedBox(height: 25),
              CustomFiled(
              labelText: "Device Brand",
              controller: brandController,
            ),
            const SizedBox(height: 25),
            PickerDevice(
              onDeviceSelected: (selectedDevice) {
                setState(() {
                  this.selectedDevice = selectedDevice;
                });
              },
            ),
            const SizedBox(height: 40),
            CustomButton(onTap: _postData, label: "Add"),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDevice(),
                  ),
                );
              },
              label: "Add Another One",
            ),
          ],
        ),
      ),
    );
  }
}
