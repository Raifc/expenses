import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType, // Remove 'const'
              onSubmitted: (_) => onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
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
