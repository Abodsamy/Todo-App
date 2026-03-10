import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final double height;
  final TextEditingController? controller;

  const CustomCard({
    super.key,
    required this.text,
    required this.height,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
        ),
        maxLines: height > 100 ? 5 : 1,
      ),
    );
  }
}
