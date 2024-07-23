import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/components/form_fields/search_bar.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/common/errors/error_widget.dart';
import 'package:pms_admin/features/permissions/data/providers/searched_student_provider.dart';
import 'package:pms_admin/features/students/domain/models/student.dart';

class SearchStudentForm extends ConsumerStatefulWidget {
  const SearchStudentForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      SearchStudentFormState();
}

class SearchStudentFormState extends ConsumerState<SearchStudentForm> {
  late TextEditingController _searchController;
  String? searchQuery;
  Student? selectedStudent;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final students = ref.watch(searchedStudentProvider(searchQuery));

    return SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Buscar estudiante"),
          const SizedBox(
            height: 15,
          ),
          OutlinedSearchBar(
            label: 'Nombre o cédula',
            controller: _searchController,
            onSearch: () {
              ref.invalidate(searchedStudentProvider);
              setState(() {
                selectedStudent = null;
                searchQuery = _searchController.text;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          students.when(
            data: (data) {
              return Column(
                children: data.map((e) {
                  return CheckboxListTile(
                    title: Text('${e.firstName} ${e.lastName}'),
                    subtitle: Text(e.cc),
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: e == selectedStudent,
                    onChanged: (value) {
                      setState(() {
                        selectedStudent = e;
                      });
                    },
                  );
                }).toList(),
              );
            },
            error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
              ref.invalidate(searchedStudentProvider);
            }),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          PrimaryButton(
            enabled: selectedStudent != null,
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pop(selectedStudent);
            },
          )
        ],
      ),
    );
  }
}
