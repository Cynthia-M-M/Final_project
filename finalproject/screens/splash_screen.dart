import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppLogo(size: 100),
            SizedBox(height: 24),
            Text(
              'Collab4SDG',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 12),
            Text('Partnerships for the Goals', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
} 