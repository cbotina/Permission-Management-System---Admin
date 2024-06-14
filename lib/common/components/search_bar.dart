import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/form_fields/search_bar.dart';
import 'package:pms_admin/common/providers/search_query_provider.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeriodsSearchBar2State();
}

class _PeriodsSearchBar2State extends ConsumerState<CustomSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchController.addListener(() {
      ref.read(searchQueryController.notifier).setQuery(_searchController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.invalidate(searchQueryController);

    return OutlinedSearchBar(
      label: "Buscar",
      controller: _searchController,
    );
  }
}
