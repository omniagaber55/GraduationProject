import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/onboardingModel.dart';
import 'package:app/veiws/LogIn.dart'; 

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = Onboarding_data(); // Instance of Onboarding_data
  final page_Controller = PageController(); // PageController for managing pages
  int currentIndex = 0; // Index to track current page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            textButton(), // Renders the text button section
            body(), // Renders the body section (PageView with onboarding items)
            buildDots(), // Renders the dot indicators section
          ],
        ),
      ),
    );
  }

  // TextButton for skipping or finishing onboarding
  Widget textButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            if (currentIndex < _controller.items.length - 1) {
              // If not on the last onboarding page, move to the next page
              setState(() {
                currentIndex++;
                page_Controller.animateToPage(
                  currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            } else {
              // If on the last onboarding page, navigate to the login screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogIn_Screen(),
                ),
              );
            }
          },
          child: Text(
            currentIndex == _controller.items.length - 1
                ? "Finish"
                : "Skip", // Show "Finish" on last page, otherwise "Skip"
            style: const TextStyle(color: PrimaryColor),
          ),
        ),
      ),
    );
  }

  // Body section with PageView for displaying onboarding items
  Widget body() {
    return Expanded(
      child: Center(
        child: PageView.builder(
          controller: page_Controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value; // Update currentIndex when page changes
            });
          },
          itemCount: _controller.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image for onboarding item
                  Image.asset(
                    _controller.items[index].image,
                    width: 430,
                    height: 430,
                  ),
                  const SizedBox(height: 28),
                  // Title for onboarding item
                  Text(
                    _controller.items[index].title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: PrimaryColor,
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

  // Dot indicators for tracking current page in PageView
  Widget buildDots() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_controller.items.length, (index) {
          return GestureDetector(
            onTap: () {
              // Jump to the selected page
              page_Controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: currentIndex == index
                    ? PrimaryColor
                    : Colors.grey, // Highlight current page dot
              ),
              height: 10,
              width: currentIndex == index
                  ? 40
                  : 10, // Adjust size of current page dot
              duration: const Duration(milliseconds: 700),
            ),
          );
        }),
      ),
    );
  }
}
