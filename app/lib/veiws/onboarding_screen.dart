
import 'package:app/Models/onboarding_data.dart';
import 'package:app/constants.dart';

import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            button(),
            body(),
            buildDots(),
          ],
        ),
      ),
    );
  }

  // Body
  Widget body() {
    return Expanded(
      child: Center(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Images
                  Image.asset(controller.items[index].image,width: 430,height: 430,),

                  const SizedBox(height: 28),
                  // Titles
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                      fontSize: 24,
                      
                      color: Color(0xff009589),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Dots
  Widget buildDots() {
    return Padding(
      padding: const EdgeInsets.only(top: 30,bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.items.length, (index) {
          return GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: currentIndex == index ? PrimaryColor : Colors.grey,
              ),
              height: 10,
              width: currentIndex == index ? 40 : 10,
              duration: const Duration(milliseconds: 700),
            ),
          );
        }),
      ),
    );
  }

  // Button
  Widget button() {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
         onPressed: () {
          if (currentIndex < controller.items.length - 1) {
        setState(() {
          currentIndex++;
          pageController.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
          } else {
    /*    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LogIn_Screen(),
  ),
);*/
          }
        },
          child: Text(
            currentIndex == controller.items.length - 1 ? "Finish" : "Skip",
            style: const TextStyle(color: Color(0xff008985)
)),
          ),
        ),
      
    );
  }
}