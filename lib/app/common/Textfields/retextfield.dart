import 'package:flutter/material.dart';

class ReTextfield extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final TextInputType? keyboardype;
  final TextStyle? style;
  const ReTextfield({
    super.key,
    required this.lable,
    required this.controller,
    this.keyboardype,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardype,
      style: style,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        label: Text(lable),
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
