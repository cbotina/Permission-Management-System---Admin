import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/forms/create_period_form.dart';

class CreatePeriodButton extends StatelessWidget {
  const CreatePeriodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      minWidth: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Text(
            "Crear Periodo",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: CreatePeriodForm(),
            );
          },
        );
      },
    );
  }
}
