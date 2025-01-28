import 'package:flutter/material.dart';

class RoundedSmallContainer extends StatelessWidget {
  final Color color;
  const RoundedSmallContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(120)
        ),
    );
  }
}
