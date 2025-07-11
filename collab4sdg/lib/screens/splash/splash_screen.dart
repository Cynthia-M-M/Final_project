import 'package:flutter/material.dart';
import 'dart:async';

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
          children: [
            Icon(Icons.handshake, size: 80, color: Colors.teal),
            const SizedBox(height: 24),
            const Text(
              'Collab4SDG',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 12),
            const Text('Partnerships for the Goals', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
} 