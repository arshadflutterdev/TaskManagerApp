import 'package:flutter/material.dart';

class ReTextfield extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final TextInputType? keyboardype;
  const ReTextfield({
    super.key,
    required this.lable,
    required this.controller,
    this.keyboardype,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardype,
      style: TextStyle(fontSize: 18),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 5),
        ),
      ),
    );
  }
}
