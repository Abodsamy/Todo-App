import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/screens/logo_screen.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/widgets/elevated_button.dart';
import 'package:todoapp/widgets/textfiled.dart';
import '../widgets/textformfiled.dart';
import '../widgets/textformfiled_password.dart';
import '../widgets/textbutton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    experienceController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Group 8.png",
                  width: double.infinity,
                  height: 420,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Register",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                CustomTextField(
                    controller: nameController,
                    hintText: 'Name',
                    fillColor: Colors.white),
                EmailFiled(controller: emailController),
                CustomTextField(
                    controller: experienceController,
                    hintText: 'Years of Experience',
                    fillColor: Colors.white),
                CustomTextField(
                    controller: addressController,
                    hintText: 'Address',
                    fillColor: Colors.white),
                PasswordField(controller: passwordController),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);
                    await prefs.setString('name', nameController.text.trim());
                    await prefs.setString('email', emailController.text.trim());

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LogoScreen()),
                    );
                  },
                ),
                CustomTextButton(
                  text: 'Already have any account? ',
                  textbutton: 'Sign in',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
