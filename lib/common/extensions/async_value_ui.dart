import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  void popOnSuccess(AsyncValue? prev, String message, BuildContext context) {
    if (!isLoading && !hasError && prev != null) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
