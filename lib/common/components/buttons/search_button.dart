import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? minWidth;
  const SearchButton({
    super.key,
    required this.onTap,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.tealAccent,
      hoverColor: Colors.tealAccent.withOpacity(.5),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Ink(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth ?? 0,
          ),
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
