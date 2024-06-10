import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/app_menu.dart';
import 'package:pms_admin/features/auth/presentation/widgets/components/buttons/logout_button.dart';
import 'package:pms_admin/features/navigation/navigation_providers.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu_rounded),
          ),
        ),
        actions: const [LogoutIconButton()],
      ),
      drawer: const Drawer(child: AppMenu()),
      body: Consumer(
        builder: (context, ref, child) {
          final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
          return selectedPageBuilder(context);
        },
      ),
    );
  }
}
