import 'package:flutter/material.dart';

BoxDecoration Gradient_Background() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Colors.grey,
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  );
}
