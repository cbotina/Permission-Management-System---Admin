import 'package:pms_admin/features/periods/data/dto/create_period_dto.dart';

class EditPeriodDto extends CreatePeriodDto {
  EditPeriodDto({
    required super.name,
    required super.startDate,
    required super.endDate,
  });
}
