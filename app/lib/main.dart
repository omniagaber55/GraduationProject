
import 'package:app/Components/Notification.dart';
import 'package:app/veiws/Home.dart';
import 'package:app/veiws/ListVeiwChat.dart';
import 'package:app/veiws/OTPpage.dart';
import 'package:app/veiws/SplashScreens.dart';
import 'package:app/veiws/chatPage.dart';



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    
      home:Otp_page()
    );
  }
}
