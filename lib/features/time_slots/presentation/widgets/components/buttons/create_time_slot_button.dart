import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/forms/create_time_slot_form.dart';

class CreateTimeSlotButton extends StatelessWidget {
  const CreateTimeSlotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      minWidth: 110,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            "Crear Franja",
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
            return const AlertDialog(
              content: CreateTimeSlotForm(),
            );
          },
        );
      },
    );
  }
}
