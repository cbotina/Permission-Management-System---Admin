import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/date_form_field.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/create_period_form_button.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/utils/date_picker.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/date_validator.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/period_name_validator.dart';

class CreatePeriodForm extends StatefulWidget {
  const CreatePeriodForm({
    super.key,
  });

  @override
  State<CreatePeriodForm> createState() => _CreatePeriodFormState();
}

class _CreatePeriodFormState extends State<CreatePeriodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _periodNameController;

  @override
  void initState() {
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _periodNameController = TextEditingController();
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
              "Crear Nuevo Periodo",
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
                onTap: () => _selectDate(_startDateController),
                controller: _startDateController,
                validator: dateValidator,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: DateFormField(
                label: 'Fecha Fin',
                onTap: () => _selectDate(_endDateController),
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
                CreatePeriodFormButton(
                  formKey: _formKey,
                  periodNameController: _periodNameController,
                  startDateController: _startDateController,
                  endDateController: _endDateController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await pickDate(context);

    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}
