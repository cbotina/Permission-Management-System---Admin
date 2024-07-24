import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/features/absences/presentation/widgets/components/buttons/delete_absence_form_button.dart';

class DeleteAbsenceForm extends StatefulWidget {
  final int absenceId;
  const DeleteAbsenceForm({
    super.key,
    required this.absenceId,
  });

  @override
  State<DeleteAbsenceForm> createState() => _DeleteAbsenceFormState();
}

class _DeleteAbsenceFormState extends State<DeleteAbsenceForm> {
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
            "Eliminar Falta",
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
              DeleteAbsenceFormButton(
                absenceId: widget.absenceId,
              )
            ],
          ),
        ],
      ),
    );
  }
}
