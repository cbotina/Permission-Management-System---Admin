import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/constants/strings.dart';
import 'package:pms_admin/pages/drawer_pages/absences_page.dart';
import 'package:pms_admin/pages/drawer_pages/groups.dart';
import 'package:pms_admin/pages/drawer_pages/leaving_permissions.dart';
import 'package:pms_admin/pages/drawer_pages/periods_page.dart';
import 'package:pms_admin/pages/drawer_pages/permission_registry.dart';
import 'package:pms_admin/pages/drawer_pages/permission_requests.dart';
import 'package:pms_admin/pages/drawer_pages/stats.dart';
import 'package:pms_admin/pages/drawer_pages/students.dart';
import 'package:pms_admin/pages/drawer_pages/subjects.dart';
import 'package:pms_admin/pages/drawer_pages/teachers.dart';
import 'package:pms_admin/pages/drawer_pages/time_slots_page.dart';
import 'package:pms_admin/pages/feature_in_development_page.dart';

class SelectedPageNameNotifier extends StateNotifier<String> {
  SelectedPageNameNotifier() : super(Strings.leavingPermissions);
  void setPage(String pageName) {
    state = pageName;
  }
}

final selectedPageNameProvider =
    StateNotifierProvider<SelectedPageNameNotifier, String>((ref) {
  return SelectedPageNameNotifier();
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageName = ref.watch(selectedPageNameProvider);
  return _builders[selectedPageName]!;
});

final _builders = <String, WidgetBuilder>{
  Strings.periods: (_) => const PeriodsPage(),
  Strings.timeSlots: (_) => const TimeSlots(),
  Strings.subjects: (_) => const FeatureInDevelopmentPage(),
  Strings.teachers: (_) => const FeatureInDevelopmentPage(),
  Strings.groups: (_) => const FeatureInDevelopmentPage(),
  Strings.students: (_) => const FeatureInDevelopmentPage(),
  Strings.permissionRequests: (_) => const PermissionRequests(),
  Strings.permissionRegistry: (_) => const PermissionRegistry(),
  Strings.stats: (_) => const Stats(),
  Strings.leavingPermissions: (_) => const LeavingPermissionsPage(),
  Strings.absencesRegistry: (_) => const AbsencesPage(),
};
