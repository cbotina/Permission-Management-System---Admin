import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
      locale: const Locale('es', "ES"),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      errorInvalidText: "Fecha Invalida");
  return pickedDate;
}
