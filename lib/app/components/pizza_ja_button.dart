import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PizzaJaButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? buttonColor;
  final String label;
  final TextStyle? style;
  final Color? labelColor;
  final double? labelSize;
  final VoidCallback? onPressed;

  const PizzaJaButton({
    Key? key,
    required this.width,
    required this.height,
    this.buttonColor,
    required this.label,
    this.style,
    this.labelColor,
    this.labelSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? TextStyle(fontSize: labelSize, color: labelColor),
        ),
      ),
    );
  }
}
