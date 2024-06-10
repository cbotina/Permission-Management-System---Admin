import 'package:flutter/material.dart';

class AlignedCell extends StatelessWidget {
  final Widget child;
  final MainAxisAlignment? mainAxisAlignment;
  const AlignedCell(
    this.child, {
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [child],
    );
  }
}

DataCell tableCell(Widget child, MainAxisAlignment? alignment) {
  return DataCell(
    AlignedCell(
      child,
      mainAxisAlignment: alignment,
    ),
  );
}
