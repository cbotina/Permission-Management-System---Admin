import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/buttons/form_buttons/detele_time_slot_form_button.dart';

class DeleteTimeSlotForm extends StatefulWidget {
  final TimeSlot timeSlot;
  const DeleteTimeSlotForm({
    super.key,
    required this.timeSlot,
  });

  @override
  State<DeleteTimeSlotForm> createState() => _DeleteTimeSlotFormState();
}

class _DeleteTimeSlotFormState extends State<DeleteTimeSlotForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Eliminar Franja ${widget.timeSlot.tag}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          const Text("Esta acción no se puede deshacer"),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecondaryButton(
                onTap: Navigator.of(context).pop,
                minWidth: 80,
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              DeleteTimeSlotFormButton(
                timeSlotId: widget.timeSlot.id,
              )
            ],
          ),
        ],
      ),
    );
  }
}
