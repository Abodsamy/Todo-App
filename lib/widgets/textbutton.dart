import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.text,
      required this.textbutton,
      required this.onPressed});

  final String text;
  final String textbutton;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black38),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textbutton,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff5F33E1),
              ),
            ))
      ],
    );
  }
}
