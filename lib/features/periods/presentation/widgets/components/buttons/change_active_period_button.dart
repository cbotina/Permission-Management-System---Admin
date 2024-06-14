import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/forms/change_active_period_form.dart';

class ChangeActivePeriodButton extends ConsumerWidget {
  const ChangeActivePeriodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final activePeriodName = ref.watch(activePeriodProvider).name;

    return ElevatedButton(
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: ChangeActivePeriodForm(),
            );
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(activePeriodName),
          const SizedBox(width: 10),
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 15,
          ),
        ],
      ),
    );
  }
}
