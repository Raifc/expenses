import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;
  const AdaptativeTextField(
      {required this.controller,
      required this.onSubmitted,
      required this.label,
      this.keyboardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType, // Remove 'const'
            onSubmitted: (_) => onSubmitted,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType, // Remove 'const'
            onSubmitted: (_) => onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
