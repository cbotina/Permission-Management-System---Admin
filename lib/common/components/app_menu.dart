import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pms_admin/common/components/drawer_item.dart';
import 'package:pms_admin/common/constants/strings.dart';
import 'package:pms_admin/features/periods/presentation/widgets/components/buttons/change_active_period_button.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                Text(
                  "Sistema Gestor de Permisos PFC",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/escudo_normal.png',
                      height: 120,
                    ),
                  ],
                ),
                const ChangeActivePeriodButton(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Datos"),
                    const SizedBox(
                      height: 15,
                    ),
                    const DrawerItem(
                      iconData: Icons.calendar_month_outlined,
                      title: Strings.periods,
                    ),
                    const DrawerItem(
                      iconData: Icons.timer_sharp,
                      title: Strings.timeSlots,
                    ),
                    const DrawerItem(
                      iconData: Icons.subject,
                      title: Strings.subjects,
                    ),
                    DrawerItem(
                      iconData: const FaIcon(
                        FontAwesomeIcons.chalkboardUser,
                      ).icon!,
                      iconSize: 18,
                      title: Strings.teachers,
                    ),
                    DrawerItem(
                      iconData: const FaIcon(
                        FontAwesomeIcons.users,
                      ).icon!,
                      iconSize: 18,
                      title: Strings.groups,
                    ),
                    const DrawerItem(
                      iconData: Icons.person,
                      title: Strings.students,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Permisos"),
                    const SizedBox(
                      height: 15,
                    ),
                    const DrawerItem(
                      iconData: Icons.notifications_active,
                      title: Strings.permissionRequests,
                    ),
                    const DrawerItem(
                      iconData: Icons.list,
                      title: Strings.permissionRegistry,
                    ),
                    const DrawerItem(
                      iconData: Icons.query_stats_sharp,
                      title: Strings.stats,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
