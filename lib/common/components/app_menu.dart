import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pms_admin/common/components/drawer_item.dart';
import 'package:pms_admin/common/constants/strings.dart';

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
                        color: Colors.white,
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
              ],
            ),
          ),

          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Container(
          //       width: 50,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //         color: Theme.of(context).colorScheme.primary,
          //         border: Border.all(
          //           color: Theme.of(context).colorScheme.primary,
          //           width: 2,
          //         ),
          //       ),
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(8),
          //         child: Image.network(
          //           'https://avatars.githubusercontent.com/u/120812443?v=4',
          //           width: 44,
          //           height: 44,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 12),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SizedBox(
          //           width: 150,
          //           child: Text(
          //             "Carlos Alberto Botina Carpio",
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .bodyLarge!
          //                 .copyWith(
          //                     fontSize: 16, fontWeight: FontWeight.w600),
          //             overflow: TextOverflow.ellipsis,
          //           ),
          //         ),
          //         Text(
          //           "Administrador",
          //           style: Theme.of(context)
          //               .textTheme
          //               .labelMedium!
          //               .copyWith(
          //                   fontSize: 14, fontWeight: FontWeight.w500),
          //         ),
          //       ],
          //     )
          //   ],
          // ),
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
