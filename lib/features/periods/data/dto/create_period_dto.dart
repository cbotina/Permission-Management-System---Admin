import 'dart:collection';

class CreatePeriodDto extends MapView<String, dynamic> {
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  CreatePeriodDto({
    required this.name,
    required this.startDate,
    required this.endDate,
  }) : super({
          "name": name,
          "startDate": startDate.toString(),
          "endDate": endDate.toString(),
        });
}
