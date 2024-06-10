import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    required this.iconData,
    this.iconSize,
  });
  final String title;
  final IconData iconData;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Theme.of(context).colorScheme.primary,
          size: iconSize,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28,
              ),
        ),
      ],
    );
  }
}
