import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AdaptativeButton(this.label, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).primaryColor, // Background color
              foregroundColor:
                  Theme.of(context).textTheme.labelLarge?.color, // Text color
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
