import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Components/otpform.dart';

class Otp_page extends StatefulWidget {
  const Otp_page({super.key});

  @override
  State<Otp_page> createState() => _Otp_pageState();
}

class _Otp_pageState extends State<Otp_page> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 69.h),
                  child: Image(
                    image: const AssetImage('assets/images/otp.png'),
                    width: 243.w,
                    height: 211.h,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  child: Column(
                    children: [
                      Text(
                        "OTP Verification Code",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32.sp,
                            color: const Color(0xff00485E)),
                      ),
                      Text(
                        "Enter Verification Code Sent To ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: PrimaryColor),
                      ),
                      Text(
                        "Your Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: PrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                const OTP(),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff006E7C)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 130.w, vertical: 15),
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
