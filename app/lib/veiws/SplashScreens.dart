import 'package:app/constants.dart';
import 'package:app/veiws/WhoAreYou.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 1), // Change the duration after 1 second
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(_animationController);

    // Change the background color and logo after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showGradient = false;
        logoAsset = 'assets/images/Group 14 (1).png';
        logoSize = const Size(270.83, 270.83);
      });
    });

    // Change the logo after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        logoAsset = 'assets/images/Group 15 (1).png';
        logoSize = const Size(330, 330);
      });
    });

    // Change the logo after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        logoAsset = 'assets/images/Group 14 (1).png';
        logoSize = const Size(270.83, 270.83);
      });
    });

    // Display the text after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showText = true;
      });
      _animationController.forward();
    });
    Future.delayed(const Duration(seconds: 7), () {
      // Navigate to the BuyerScreen after 7 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WhoAreYou()),
      );
    });
  }

  List<Color> gradientColors = [
    PrimaryColor.withOpacity(.9),
    PrimaryColor.withOpacity(.7),
  ];
  String logoAsset = 'assets/images/Group 5.png';
  Size logoSize = const Size(158, 172);
  String text = 'BIOVOLTEX';
  bool showText = false;
  bool showGradient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (showGradient)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: const Alignment(1.00, 0.00),
                  end: const Alignment(-1, 0),
                ),
              ),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoAsset,
                  width: logoSize.width,
                  height: logoSize.height,
                ),
                const SizedBox(height: 20),
                if (showText)
                  SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Source Serif Pro',
                        color: PrimaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
