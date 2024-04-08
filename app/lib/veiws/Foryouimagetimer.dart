import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ImageTimer extends StatefulWidget {
  @override
  _ImageTimerState createState() => _ImageTimerState();
}

class _ImageTimerState extends State<ImageTimer> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 29930), () {
      setState(() {
        _isVisible = false;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        actions: [IconButton(onPressed: () {},
            icon: const Icon(Icons.edit_square,
              color: Colors.white,))],),
      body:

      Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    color:PrimaryColor ,
                    height: 270,
                    child: Column(

                      children: [
                        Container(
                          color:  PrimaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,          children: [
                            const Image(
                                width: 29.67,
                                height: 29.67,
                                image: AssetImage('assets/images/foryou.png',)),
                            const SizedBox(width:20,),
                            Text(
                              "For You",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                          ),
                        ),


                      ],
                    ),
                  ),

                  SingleChildScrollView(scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                            decoration:
                            const BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                                    topLeft:Radius.circular(16) )),
                            margin: const EdgeInsets.only(top: 240),
                            width: double.infinity,
                            height: 350.h,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                         PrimaryColor),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16))),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 100.w, vertical: 15),
                                    child: Text(
                                      "Verify",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),

            ],),

          Container(
            color:  const Color.fromARGB(15, 0, 0, 0),

            child: Visibility(

              visible: _isVisible,
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.center,                children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(

                    child: Stack(

                      children: [
                        Container(
                          width: 253,

                          height: 126,

                          decoration: const BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(500),topLeft: Radius.circular(500),bottomLeft: Radius.circular(500))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'You have saved 25 L of gas Which Turn on the stove for 3 H. Click this button to add your existing devices that you want to play on the machine',
                                  textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: PrimaryColor,
                                  ),
                                  speed: const Duration(milliseconds: 200),
                                ),
                              ],

                              totalRepeatCount: 1,
                              pause: const Duration(minutes: 5),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                          ),   ),
                        Container(
                            margin: EdgeInsets.only(left: 160.w,top: 30.h),
                            child: Lottie.asset("assets/images/nTJyEKJ42j.json",width: 300.w)),
                      ],
                    ),
                  ),
                ),
              ],
              ),
              // Replace with your image path
            ),
          ),
        ],
      ),


    );
  }
}