import 'package:flutter/material.dart';
import 'package:todoapp/screens/logo_screen.dart';
import 'package:todoapp/widgets/custom_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LogoScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  const Text(
                    ' Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff24252C),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                text: 'Name',
                height: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                text: 'Phone',
                height: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                text: 'Experience',
                height: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                text: 'Address',
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
