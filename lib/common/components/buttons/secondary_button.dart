import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? minWidth;
  const SecondaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.tealAccent,
        hoverColor: Colors.tealAccent.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: 40,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
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
