import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const DeleteIconButton({
    super.key,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      icon: Icon(
        Icons.delete,
        color: enabled ? Colors.pink : Colors.grey.shade300,
      ),
      splashRadius: 15,
    );
  }
}
