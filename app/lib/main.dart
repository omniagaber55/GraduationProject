import 'package:app/constants.dart';

import 'package:app/veiws/onboarding_screen.dart';
import 'package:app/veiws/who_are_you.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: PrimaryColor),
        useMaterial3: true,
      ),
      home: WhoAreYou(),
    );
  }
}
