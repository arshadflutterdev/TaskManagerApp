import 'package:flutter/material.dart';

class ReTextbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;
  const ReTextbutton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text, style: style),
    );
  }
}
