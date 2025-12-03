import 'package:flutter/material.dart';

class StylishContainer extends StatelessWidget {
  final double heights;
  final double widhts;
  const StylishContainer({
    super.key,
    required this.heights,
    required this.widhts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heights,
      width: widhts,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 04,
            offset: Offset(02, 01),
            color: Colors.black45,
            spreadRadius: 01,
          ),
        ],
      ),
    );
  }
}
