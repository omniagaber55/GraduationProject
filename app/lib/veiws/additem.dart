import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Components/Customfiled.dart';
import '../Components/Numberpickeramount.dart';
import '../Components/Numberprice.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(235, 248, 248, 248),
        title: const SizedBox(
          child: Text(
            "Add Item",
            style: TextStyle(color: PrimaryColor, fontSize: 32),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15),
            child:  const Image(image: AssetImage('assets/images/add.png')),
            width: 30.w,
            height: 30.h,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Custom_filed(
            labelText: "Your Name",
          ),
          const SizedBox(
            height: 20,
          ),
          Custom_filed2(
            labelText: "Your Address",
          ),
          const SizedBox(
            height: 40,
          ),
          const PickerAmount(),
          const SizedBox(
            height: 20,
          ),
          const Pickerprice(),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(PrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 10.h),
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                ),
              ),
            ),
          )
        ]),
      ),
    ) ;
  }
}
