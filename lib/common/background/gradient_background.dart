import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffe5e1e2), Color(0xff7941fb)],
          stops: [0.25, 0.85],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ,
      ),
      child: child,
    );
  }
}
