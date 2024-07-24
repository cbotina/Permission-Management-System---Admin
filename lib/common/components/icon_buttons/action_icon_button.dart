import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const ActionIconButton(
      {super.key, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      hoverColor: Colors.teal,
      icon: Icon(
        Icons.approval,
        color: enabled ? Colors.deepPurple : Colors.grey.shade200,
      ),
      splashRadius: 15,
    );
  }
}
