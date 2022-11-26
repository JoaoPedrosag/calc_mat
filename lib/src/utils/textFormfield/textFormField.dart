import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends TextFormField {
  final String labelText;
  @override
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? color;
  @override
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final Widget? suffixIcon;

  CustomTextFormField({
    Key? key,
    this.suffixIcon,
    this.obscureText,
    this.inputFormatters,
    this.prefixIcon,
    this.validator,
    required this.keyboardType,
    required this.controller,
    this.color,
    required this.labelText,
  }) : super(
          key: key,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          textAlign: TextAlign.end,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.white.withOpacity(0.2),
            filled: true,
            floatingLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 201, 202, 209),
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 201, 202, 209), width: 2),
            ),
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
}
