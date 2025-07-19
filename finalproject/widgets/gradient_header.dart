import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  const GradientHeader({Key? key, required this.text, this.fontSize = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFF43A047),
            Color(0xFF1976D2),
            Color(0xFFE91E63),
            Color(0xFFFFEB3B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
} 