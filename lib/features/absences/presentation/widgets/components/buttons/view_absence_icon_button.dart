import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/icon_buttons/view_icon_button.dart';
import 'package:pms_admin/features/absences/domain/models/absence_with_student_view.dart';

class ViewAbsenceIconButton extends StatelessWidget {
  final AbsenceWithStudentView absence;
  final bool enabled;

  const ViewAbsenceIconButton({
    super.key,
    required this.absence,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ViewIconButton(
        enabled: enabled,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: AbsenceDetailsWidget(absence: absence),
              );
            },
          );
        });
  }
}

class AbsenceDetailsWidget extends ConsumerWidget {
  final AbsenceWithStudentView absence;
  const AbsenceDetailsWidget({
    super.key,
    required this.absence,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Detalles de Falta",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              style:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(height: 2),
              children: [
                const TextSpan(
                  text: "Fecha de falta: ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: DateFormat.yMMMMd().format(absence.absenceDate),
                ),
                const TextSpan(
                  text: "\nEstudiante: ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: absence.student),
                const TextSpan(
                  text: "\nHoras:  ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text:
                      '${absence.startTime.format(context).padLeft(8, '0')} - ${absence.endTime.format(context).padLeft(8, '0')}',
                ),
                const TextSpan(
                  text: "\nMateria:  ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: absence.subjectName),
                const TextSpan(
                  text: "\nComentario Docente:  ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: absence.teacherNote ?? "N/A"),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: PrimaryButton(
              minWidth: 100,
              child: const Text(
                "Salir",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
