import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';

class LogoutIconButton extends ConsumerWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
      onPressed: () async {
        await ref.read(authControllerProvider.notifier).logout();
      },
      icon: const Icon(Icons.logout),
    );
  }
}
