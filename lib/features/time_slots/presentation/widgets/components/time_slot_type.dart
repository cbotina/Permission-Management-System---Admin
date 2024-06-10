import 'package:flutter/material.dart';

class TimeSlotType extends StatelessWidget {
  final bool isAcademic;
  const TimeSlotType({
    super.key,
    required this.isAcademic,
  });

  Color getColor(bool isAcademic) => isAcademic ? Colors.green : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: getColor(isAcademic), width: 1),
        color: getColor(isAcademic).withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        isAcademic ? "Clase" : "Descanso",
        textAlign: TextAlign.center,
      ),
    );
  }
}
