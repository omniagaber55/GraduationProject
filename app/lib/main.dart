
import 'package:app/constants.dart';
import 'package:app/veiws/onboarding_screen.dart';
import 'package:app/veiws/ottppage.dart';
import 'package:app/veiws/who_are_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
      return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: PrimaryColor),
        useMaterial3: true,
      ));},
      child:Otp_page (),
    );
  }
}
