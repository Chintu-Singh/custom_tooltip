import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  final String message;
  final double textSize;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final double width;
  final double arrowWidth;
  final double arrowHeight;
  final String selectedButton;
  final String selectedTarget;
  Image? pImage;
  ButtonsPage({
    required this.message,
    required this.textSize,
    required this.textColor,
    required this.backgroundColor,
    required this.cornerRadius,
    required this.width,
    required this.arrowWidth,
    required this.arrowHeight,
    required this.selectedButton,
    required this.selectedTarget,
    required this.pImage,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Buttons Page");
  }
}
