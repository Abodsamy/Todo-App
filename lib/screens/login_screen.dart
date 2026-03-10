import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/screens/logo_screen.dart';
import 'package:todoapp/screens/register_screen.dart';
import 'package:todoapp/widgets/elevated_button.dart';
import '../widgets/textformfiled.dart';
import '../widgets/textformfiled_password.dart';
import '../widgets/textbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                  "Login",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                EmailFiled(controller: emailController),
                PasswordField(controller: passwordController),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  text: 'Sign In',
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);
                    await prefs.setString('email', emailController.text.trim());

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LogoScreen()),
                    );
                  },
                ),
                CustomTextButton(
                  text: 'Didn’t have any account? ',
                  textbutton: 'Sign Up here',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
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
