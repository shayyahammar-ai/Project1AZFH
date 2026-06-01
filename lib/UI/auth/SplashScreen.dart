import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_azfh/UI/auth/onboarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController fadeController;

  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  late AnimationController dotController;
  late Animation<double> dot1;
  late Animation<double> dot2;
  late Animation<double> dot3;

  @override
  void initState() {
    super.initState();

    // الصورة
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    scaleAnimation = CurvedAnimation(
      parent: scaleController,
      curve: Curves.easeOutBack,
    );

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeOut,
    );

    // النقاط (3 مراحل)
    dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    dot1 = CurvedAnimation(
      parent: dotController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );

    dot2 = CurvedAnimation(
      parent: dotController,
      curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
    );

    dot3 = CurvedAnimation(
      parent: dotController,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
    );

    scaleController.forward();
    fadeController.forward();
    dotController.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   OnboardingScreen ()),
      );
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    fadeController.dispose();
    dotController.dispose();
    super.dispose();
  }

  Widget buildDot(Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Color(0xFF15A5A5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfefefe),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    width: 550,
                    height: 550,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/ph5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

             Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    buildDot(dot1),
    const SizedBox(width: 6),
    buildDot(dot2),
    const SizedBox(width: 6),
    buildDot(dot3),
  ],
),
            ],
          ),
        ),
      ),
    );
  }
}


