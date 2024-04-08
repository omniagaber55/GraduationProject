import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

class PickerDevice extends StatefulWidget {
  const PickerDevice({super.key});

  @override
  State<PickerDevice> createState() => _PickerDeviceState();
}

class _PickerDeviceState extends State<PickerDevice> {
  int _thirdDevice=500;

  void _thirddevice() {
    setState(() {
      _thirdDevice++;
    });
  }

  void _thirddevicess() {
    setState(() {
      _thirdDevice--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 288,
      height: 206,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff009589)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(

          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Device Consumption",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff009589)),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _thirddevice();
                  },

                  child: Container(
                    margin: const EdgeInsets.only(left: 70),
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(

                      child: NumberPicker(
                        value:   _thirdDevice,
                        minValue: 0,
                        maxValue: 1000,
                        step: 1,
                        itemHeight: 40,
                        itemWidth: 80,
                        axis: Axis.vertical,
                        onChanged: (value) => setState(() =>   _thirdDevice = value),
                        textStyle:  TextStyle(
                            color: const Color.fromARGB(50, 0, 137, 149),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        selectedTextStyle:  TextStyle(
                            fontSize: 20.sp, color: const Color(0xff009589), fontWeight: FontWeight.w400),
                      ),
                    ),
                    // Text("Current value:${_currentHorizontalIntValue}"),
                  ],
                ),

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _thirddevicess();
                      },
                      child:  const Icon(
                        Icons.remove,
                        size: 25,
                        color: Color(0xff009589),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Text("W", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff009589)),) ],
                ),

              ],
            )
          ]),
    );
  }
}
