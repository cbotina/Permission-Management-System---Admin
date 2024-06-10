import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? minWidth;
  final Color? backgroundColor;
  final Color? hoverColor;
  final bool enabled;
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.minWidth,
    this.backgroundColor,
    this.hoverColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: enabled ? onTap : null,
        splashColor: Colors.tealAccent,
        hoverColor: hoverColor ?? Colors.tealAccent.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: 40,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: enabled
                ? backgroundColor ?? Theme.of(context).colorScheme.primary
                : Colors.grey.shade400,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: minWidth ?? 0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
