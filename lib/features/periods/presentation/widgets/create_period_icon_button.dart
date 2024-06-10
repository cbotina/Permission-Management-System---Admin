import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';

class CreatePeriodButton extends StatelessWidget {
  const CreatePeriodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      minWidth: 130,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            "Crear Periodo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Crear Periodo",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
    );
  }
}
