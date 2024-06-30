
import 'package:app/veiws/MarketForUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:app/constants.dart';
import 'package:app/Components/CustomFeild.dart';
import 'package:app/components/pickerAmount.dart';
import 'package:app/Components/PickerPrice.dart';
import 'package:app/Components/CustomButtom.dart';
// Adjust according to your actual import path

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  int amount = 500;
  int price = 500; // Default price

  Future<void> _postData() async {
    String name = nameController.text.trim();
    String address = addressController.text.trim();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 33|TsM4ZeboAzmCEFgcKC0DIwNLPJhxUrydQ9b6qv5I0dd7dfae',
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://3b3a-197-43-150-8.ngrok-free.app/api/add-item'));
    request.headers.addAll(headers);
    request.fields.addAll({
      'price': price.toString(),
      'amount': amount.toString(),
      'user_name': name,
      'user_address': address,
    });

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Data added successfully');
        print(await response.stream.bytesToString());

        // Navigate back to previous screen (MarketForUser) after successful addition
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MarketForUser(),
          ),
        );
      } else {
        print('Failed to add data. Status code: ${response.statusCode}');
        print('Response reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception occurred: $e');
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
          "Add Item",
          style: TextStyle(color: PrimaryColor, fontSize: 32),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: const Image(
                image: AssetImage('assets/images/add.png')),
            width: 30,
            height: 30,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CustomFiled(
                  labelText: "Your Name",
                  controller: nameController,
                ),
              ),
              const SizedBox(height: 35),
              CustomFiled(
                labelText: "Your Address",
                controller: addressController,
              ),
              const SizedBox(height: 30),
              PickerAmount(
                onAmountSelected: (selectedAmount) {
                  setState(() {
                    amount = selectedAmount;
                  });
                },
              ),
              const SizedBox(height: 30),
              Pickerprice(
                onPriceSelected: (selectedPrice) {
                  setState(() {
                    price = selectedPrice;
                  });
                },
              ),
              const SizedBox(height: 45),
              CustomButton(onTap: _postData, label: "Add"),
            ],
          ),
        ),
      ),
    );
  }
}
