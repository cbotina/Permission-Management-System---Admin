import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/buttons/secondary_button.dart';
import 'package:pms_admin/common/components/form_fields/date_form_field.dart';
import 'package:pms_admin/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/common/constants/default_reasons.dart';
import 'package:pms_admin/common/extensions/string_to_date.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/utils/date_picker.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/validators/date_validator.dart';
import 'package:pms_admin/features/permissions/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_admin/features/permissions/data/providers/day_time_slots_provider.dart';
import 'package:pms_admin/features/permissions/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/date_range_time_slots.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/select_student_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/select_time_slots_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/student_form_field.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/form_buttons/create_leaving_permission_form_button.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/validators/other_reason_validator.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/validators/reason_validator.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';

class CreateLeavingPermissionPage extends ConsumerStatefulWidget {
  const CreateLeavingPermissionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateLeavingPermissionPageState();
}

class _CreateLeavingPermissionPageState
    extends ConsumerState<CreateLeavingPermissionPage> {
  // late DateTimeRange? selectedRange;
  late TextEditingController _justificationDeadlineController;
  late ScheduleRangeDatesDto? dto;
  String? selectedReason;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _otherReasonController;
  late TextEditingController _studentNameController;
  late Student? selectedStudent;

  // void setSelectedRange(DateTimeRange newTimeRange) {
  //   setState(() {
  //     selectedRange = newTimeRange;
  //   });
  // }

  void setSelectedStudent(Student student) {
    setState(() {
      dto = null;
      // selectedRange = null;
      ref.invalidate(dayTimeSlotsProvider);
      ref.read(selectedAbsenceTimeSlotsProvider).reset();
      selectedStudent = student;
      _studentNameController.text = '${student.firstName} ${student.lastName}';
    });
  }

  @override
  void initState() {
    _otherReasonController = TextEditingController();
    _studentNameController = TextEditingController();
    _justificationDeadlineController = TextEditingController();
    // selectedRange = null;
    dto = null;
    selectedStudent = null;
    super.initState();
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    _studentNameController.dispose();
    _justificationDeadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedStudent != null) {
      final today = DateTime.now();
      final day = today.day;
      final month = today.month;
      final year = today.year;

      dto = ScheduleRangeDatesDto(
        startDate: DateTime(year, month, day),
        endDate: DateTime(year, month, day),
        studentId: selectedStudent!.id,
      );
    }

    // int? selectedDays = selectedRange?.duration.inDays;

    final daytimeSlots = ref.watch(dayTimeSlotsProvider(dto));

    bool enabled = selectedStudent != null &&
        ref.watch(selectedAbsenceTimeSlotsProvider).absenceTimeSlots.isNotEmpty;

    return Container(
      // width: MediaQuery.of(context).size.width * .8,
      // height: MediaQuery.of(context).size.height * .6,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Crear Permiso de Salida",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SelectStudentButton(
                      setStudent: setSelectedStudent,
                      studentNameController: _studentNameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EnumDropdownButtonFormField(
                      label: 'Motivo',
                      onSelected: (reason) {
                        setState(() {
                          selectedReason = reason;
                        });
                      },
                      values: defaultReasons,
                      validator: reasonValidator,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: selectedReason == 'Otro',
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OutlinedTextFormField(
                            label: "Especicar Motivo",
                            controller: _otherReasonController,
                            validator: otherReasonValidator,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    DateFormField(
                      validator: dateValidator,
                      controller: _justificationDeadlineController,
                      label: 'Plazo para justificar',
                      onTap: () =>
                          _selectDate(_justificationDeadlineController),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: selectedStudent != null,
                      child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          child: daytimeSlots.when(
                            data: (data) =>
                                DateRangeTimeSlotsWidget(dayTimeSlots: data),
                            error: (error, stackTrace) => const Text(
                                "Ha ocurrido un error, vuelva a seleccionar la fecha"),
                            loading: () => const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CreateLeavingPermissionFormButton(
                formKey: _formKey,
                enabled: enabled,
                studentId: selectedStudent?.id,
                selectedReason: selectedReason,
                justificationDeadlineController:
                    _justificationDeadlineController,
                otherReasonController: _otherReasonController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final initialDate = DateTime.now();
    DateTime? pickedDate = await pickDate(initialDate, context);

    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}
