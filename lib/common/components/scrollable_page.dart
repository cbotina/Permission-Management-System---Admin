import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ],
    );
  }
}
