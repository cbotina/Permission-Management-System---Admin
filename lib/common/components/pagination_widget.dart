import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/icon_buttons/go_back_icon_button.dart';
import 'package:pms_admin/common/components/icon_buttons/go_forward_icon_button.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  final int totalPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == totalPages;
    final bool isFirstPage = currentPage == 1;

    return Container(
      color: Colors.white,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoBackButton(
            onTap: () {},
            enabled: !isFirstPage,
          ),
          Text(
            "Página $currentPage de $totalPages",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GoForwardButton(
            onTap: () {},
            enabled: !isLastPage,
          ),
        ],
      ),
    );
  }
}
