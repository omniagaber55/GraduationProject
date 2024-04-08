import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Components/Customfromfiled add device.dart';
import '../Components/pickerDevice.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: const Color.fromARGB(235, 248, 248, 248),
        title: const Icon(Icons.arrow_back,color:PrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Row(mainAxisAlignment:MainAxisAlignment.center ,
            children: [Icon(Icons.add_box_outlined,color:PrimaryColor),
              SizedBox(width: 10,),
              Text("Add Device",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color:PrimaryColor),)],),
          const SizedBox(height: 20,),
          Textfrom_filedDevicename(
            labelText: "Device Name",
          ),
          const SizedBox(
            height: 20,
          ),
          Textfrom_filedDeviceBrand(
            labelText: "Device Brand",
          ),
          const SizedBox(
            height: 40,
          ),

          const PickerDevice(),
          SizedBox(
            height: 20.h,
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
          ),
          SizedBox(
            height: 20.h,
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
              padding: EdgeInsets.symmetric(horizontal: 53.w, vertical: 15.h),
              child: Text(
                "Add Another One",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
