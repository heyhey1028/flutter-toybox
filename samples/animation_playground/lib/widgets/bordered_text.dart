import 'package:flutter/material.dart';

// Reference: https://www.kindacode.com/snippet/adding-a-border-to-text-in-flutter/
class BorderedText extends StatelessWidget {
  const BorderedText({
    super.key,
    required this.text,
    required this.textColor,
    required this.borderColor,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 5,
    this.strokeWidth = 10,
  });

  final String text;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Implement the stroke
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        // The text inside
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
