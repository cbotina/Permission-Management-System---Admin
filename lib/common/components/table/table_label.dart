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
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: foregroundColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
