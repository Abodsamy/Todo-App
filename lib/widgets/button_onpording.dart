import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class ButtonOnPording extends StatelessWidget {
  const ButtonOnPording({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
      child: Container(
        height: 49,
        width: 331,
        decoration: BoxDecoration(
          color: const Color(0xff5F33E1),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Let s Start',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
