import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After 2.5s go to providers screen
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/providers');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF233E8B), // brand-like color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // You can replace this with Image.asset('assets/logos/logo.png')
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.sim_card,
                size: 72,
                color: Color(0xFF233E8B),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'AFG Sim',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
