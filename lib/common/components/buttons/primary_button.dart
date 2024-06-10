import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? minWidth;
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.tealAccent,
      hoverColor: Colors.tealAccent.withOpacity(.5),
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth ?? 0,
          ),
          child: child,
        ),
      ),
    );
  }
}
