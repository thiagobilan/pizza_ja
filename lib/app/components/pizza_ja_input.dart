import 'package:flutter/material.dart';

class PizzaJaInput extends StatelessWidget {
  final String label;
  final Icon? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final bool? obscureText;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;

  const PizzaJaInput({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.obscureText = false,
    required this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: suffixIconOnPressed,
              )
            : null,
      ),
      obscureText: obscureText!,
    );
  }
}
