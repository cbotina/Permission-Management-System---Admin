import 'package:flutter/material.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/search_student_form.dart';
import 'package:pms_admin/features/permissions/presentation/widgets/components/create_leaving_permission/student_form_field.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';

class SelectStudentButton extends StatelessWidget {
  final void Function(Student student) setStudent;
  const SelectStudentButton({
    super.key,
    required TextEditingController studentNameController,
    required this.setStudent,
  }) : _studentNameController = studentNameController;

  final TextEditingController _studentNameController;

  @override
  Widget build(BuildContext context) {
    return StudentFormField(
      onTap: () async {
        final student = await showDialog<Student>(
          context: context,
          builder: (context) => const AlertDialog(
            content: SearchStudentForm(),
          ),
        );

        if (student != null && context.mounted) {
          setStudent(student);
        }
      },
      controller: _studentNameController,
      label: "Estudiante",
    );
  }
}
