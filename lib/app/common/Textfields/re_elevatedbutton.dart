import 'package:flutter/material.dart';

class ReElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ReElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
