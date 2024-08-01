import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/scrollable_page.dart';

class FeatureInDevelopmentPage extends StatelessWidget {
  const FeatureInDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: .3,
            child: Image.asset(
              'assets/images/development.png',
              height: MediaQuery.of(context).size.height * .25,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Funcionalidad en Desarrollo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
