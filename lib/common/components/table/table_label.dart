import 'package:flutter/material.dart';

class TableLabel extends StatelessWidget {
  final String text;
  final Color foregroundColor;
  const TableLabel(
    this.text, {
    super.key,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
