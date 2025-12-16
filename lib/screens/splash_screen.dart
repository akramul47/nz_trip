import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imagePadding = screenSize.width * 0.20;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: imagePadding),
              child: Image.asset('assets/images/splash_logo.png'),
            ),
            const Spacer(),
            // Tagline at the bottom
            Padding(
              padding: EdgeInsets.only(
                  bottom: 60, left: imagePadding, right: imagePadding),
              child: Image.asset('assets/images/splash_text.png'),
            ),
          ],
        ),
      ),
    );
  }
}
