import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/periods/data/providers/periods_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final dto = ScheduleRangeDatesDto(
    //     startDate: DateTime(2024, 6, 25), endDate: DateTime(2024, 6, 28));

    // final now = DateTime.now();
    // final year = now.year;
    // final month = now.month;
    // final day = now.day;
    // final date = DateTime(year, month, day);
    // final dr =
    //     ref.watch(scheduleWithDailyReportsProvider(DateTime(year, month, day)));
    // final student = ref.watch(studentInfoProvider(1));
    // const options = SubjectGroupStudentAbsenceSearchOptions(
    //   studentId: 42,
    //   subjectGroupId: 62,
    // );
    final provider = ref.watch(allPeriodsProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (data) {
            return Text(data.toString());
            // ^ List results
            // return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data.elementAt(index).toString()),
            //       subtitle: Text(index.toString()),
            //     );
            //   },
            // );
            // return ListView.builder(
            //   itemCount: data.items.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data.items.elementAt(index).toString()),
            //       subtitle: Text(index.toString()),
            //     );
            //   },
            // );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
