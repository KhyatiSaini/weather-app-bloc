import 'package:flutter/material.dart';

SnackBar getSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 14,
      ),
    ),
    backgroundColor: Colors.cyan,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    dismissDirection: DismissDirection.down,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(
      milliseconds: 1200,
    ),
  );
}
