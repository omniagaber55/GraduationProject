import 'dart:math';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double animationValue; // Animation value to control the wave height

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = PrimaryColor // Green color for the wave
      ..style = PaintingStyle.fill;
    final pathGreen = Path();
    pathGreen.moveTo(0, size.height);
    pathGreen.lineTo(0, size.height * 0.6); // Starting point for the wave

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height * 0.56 +
          animationValue *
              30 *
              sin((i / size.width) * 2.5 * pi); // Calculate wave shape
      pathGreen.lineTo(x, y); // Define wave path
    }

    pathGreen.lineTo(size.width, size.height); // Complete the wave path
    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen); // Draw the green wave
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the wave continuously
  }
}
class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust duration as needed
    )..repeat(reverse: true); // Repeat the animation back and forth

    _animation = Tween<double>(begin: 0.2, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Adjust animation curve as needed
      ),
    );

    _controller.addListener(() {
      setState(() {}); // Trigger UI rebuild on animation frame updates
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust size as needed
      height: 200, // Adjust size as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // White background for the circle
        border: Border.all(color: Colors.white, width: 2.0),
      ),
      child: ClipOval(
        child: CustomPaint(
          painter: WavePainter(_animation.value),
        ),
      ),
    );
  }
}
