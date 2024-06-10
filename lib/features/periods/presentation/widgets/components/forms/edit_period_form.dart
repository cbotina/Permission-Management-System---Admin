import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/date_form_field.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/features/periods/domain/models/period.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/utils/date_picker.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/date_validator.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/period_name_validator.dart';

class EditPeriodForm extends StatefulWidget {
  final Period period;

  const EditPeriodForm({
    super.key,
    required this.period,
  });

  @override
  State<EditPeriodForm> createState() => _EditPeriodFormState();
}

class _EditPeriodFormState extends State<EditPeriodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _periodNameController;

  @override
  void initState() {
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _periodNameController = TextEditingController();

    _startDateController.text =
        widget.period.startDate.toString().split(" ")[0];

    _endDateController.text = widget.period.endDate.toString().split(" ")[0];

    _periodNameController.text = widget.period.name;

    super.initState();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _periodNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 300,
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
              "Editar Periodo ${widget.period.name}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: OutlinedTextFormField(
                label: 'Nombre',
                controller: _periodNameController,
                validator: periodNameValidator,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: DateFormField(
                label: 'Fecha Inicio',
                onTap: () => _selectDate(_startDateController, context),
                controller: _startDateController,
                validator: dateValidator,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: DateFormField(
                label: 'Fecha Fin',
                onTap: () => _selectDate(_endDateController, context),
                controller: _endDateController,
                validator: dateValidator,
              ),
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
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final period = Period(
                        id: 1,
                        name: _periodNameController.text,
                        startDate: _parseDate(_startDateController.text),
                        endDate: _parseDate(_endDateController.text),
                      );

                      log(period.toString());
                    }
                  },
                  minWidth: 80,
                  child: const Text(
                    "Aceptar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DateTime _parseDate(String date) {
    final parts = date.split('-').map((e) => int.parse(e)).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }

  Future<void> _selectDate(
      TextEditingController controller, BuildContext context) async {
    DateTime? pickedDate = await pickDate(context);

    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}
