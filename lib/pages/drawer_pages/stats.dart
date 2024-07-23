import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/absences/data/providers/period_absences_provider.dart';

class Stats extends ConsumerWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final list = ref.watch(absencesProvider(1));
    return Center(
        child: list.when(
      data: (data) {
        return Column(
          children: data.items.map((e) => Text(e.toString())).toList(),
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(
        onRefresh: () {
          ref.invalidate(absencesProvider);
        },
      ),
      loading: () => const CircularProgressIndicator(),
      skipLoadingOnRefresh: false,
    ));
  }
}
