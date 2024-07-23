import 'package:flutter/material.dart';

class ViewIconButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const ViewIconButton({super.key, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      hoverColor: Colors.teal,
      icon: Icon(
        Icons.info_outline,
        color: enabled ? Colors.blue : Colors.grey.shade200,
      ),
      splashRadius: 15,
    );
  }
}
