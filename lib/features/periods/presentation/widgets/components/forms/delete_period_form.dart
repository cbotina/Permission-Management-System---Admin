import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/form_buttons/delete_period_form_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/delete_period_confirmation_validator.dart';

class DeletePeriodForm extends StatefulWidget {
  final Period period;
  const DeletePeriodForm({
    super.key,
    required this.period,
  });

  @override
  State<DeletePeriodForm> createState() => _DeletePeriodFormState();
}

class _DeletePeriodFormState extends State<DeletePeriodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _confirmationController;
  late String confirmationString = 'eliminar periodo ${widget.period.name}';
  bool confirmed = false;

  @override
  void initState() {
    _confirmationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _confirmationController.addListener(
      () {
        setState(() {
          confirmed = _confirmationController.text == confirmationString;
          log(_confirmationController.text);
        });
      },
    );
    return Form(
      key: _formKey,
      child: Container(
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
              "Eliminar Periodo",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.7,
                ),
                children: [
                  const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.normal),
                    text:
                        "Al eliminar un periodo, se eliminará toda su información relacionada. Esto incluye: Grupos, Estudiantes, Franjas horarias, Permisos y Matrículas realizadas en dicho periodo. ",
                  ),
                  const TextSpan(
                    text: "Esta acción ",
                  ),
                  const TextSpan(
                      text: " NO ", style: TextStyle(color: Colors.red)),
                  const TextSpan(
                    text: " se puede deshacer.",
                  ),
                  const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.normal),
                    text:
                        "\nPara confirmar la eliminación del periodo, digite el siguiente comando: ",
                  ),
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade800,
                    ),
                    text: confirmationString,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            OutlinedTextFormField(
              hint: confirmationString,
              controller: _confirmationController,
              validator: deletePeriodConfirmationValidator,
            ),
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
                DeletePeriodFormButton(
                  formKey: _formKey,
                  confirmed: confirmed,
                  periodId: widget.period.id,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
