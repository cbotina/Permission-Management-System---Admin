import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/hour_form_field.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/features/time_slots/domain/models/time_slot.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/utils/time_picker.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/validators/time_slot_label_validator.dart';
import 'package:pms_admin/features/time_slots/presentation/widgets/components/validators/time_validator.dart';

class EditTimeSlotForm extends StatefulWidget {
  final TimeSlot timeSlot;
  final String startTimeText;
  final String endTimeText;
  const EditTimeSlotForm({
    super.key,
    required this.timeSlot,
    required this.startTimeText,
    required this.endTimeText,
  });

  @override
  State<EditTimeSlotForm> createState() => _EditTimeSlotFormState();
}

class _EditTimeSlotFormState extends State<EditTimeSlotForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _labelController;
  late TextEditingController _startTimeController;
  TimeOfDay _startTime = const TimeOfDay(hour: 7, minute: 0);
  late TextEditingController _endTimeController;
  TimeOfDay _endTime = const TimeOfDay(hour: 7, minute: 0);
  bool isRestTime = false;

  @override
  void initState() {
    _labelController = TextEditingController();
    _labelController.text = widget.timeSlot.tag;

    _startTimeController = TextEditingController();
    _startTime = widget.timeSlot.startTime;

    _endTimeController = TextEditingController();
    _endTime = widget.timeSlot.endTime;

    _startTimeController.text = widget.startTimeText;
    _endTimeController.text = widget.endTimeText;

    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Editar Franja ${widget.timeSlot.tag}",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  child: OutlinedTextFormField(
                    label: 'Etiqueta',
                    controller: _labelController,
                    validator: timeSlotLabelValidator,
                  ),
                ),
                Row(
                  children: [
                    Checkbox.adaptive(
                      value: isRestTime,
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          isRestTime = value ?? false;
                        });
                      },
                      splashRadius: 12,
                    ),
                    const Text("Descanso")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: HourFormField(
                label: 'Hora Inicio',
                controller: _startTimeController,
                validator: timeValidator,
                onTap: _selectStartTime,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: HourFormField(
                label: 'Hora Fin',
                controller: _endTimeController,
                validator: timeValidator,
                onTap: _selectEndTime,
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
                      final timeSlot = TimeSlot(
                        periodId: 1,
                        tag: _labelController.text,
                        startTime: _startTime,
                        endTime: _endTime,
                        isAcademic: !isRestTime,
                      );

                      log(timeSlot.toString());
                    }
                  },
                  minWidth: 80,
                  child: const Text(
                    "Crear",
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

  Future<void> _selectStartTime() async {
    TimeOfDay? pickedTime =
        await pickTime(context, _startTime, "SELECCIONAR HORA DE INICIO");
    if (pickedTime != null) {
      setState(() {
        _startTimeController.text = pickedTime.format(context);
        _startTime = pickedTime;
      });
    }
  }

  Future<void> _selectEndTime() async {
    TimeOfDay? pickedTime =
        await pickTime(context, _endTime, "SELECCIONAR HORA DE FIN");
    if (pickedTime != null) {
      setState(() {
        _endTimeController.text = pickedTime.format(context);
        _endTime = pickedTime;
      });
    }
  }
}
