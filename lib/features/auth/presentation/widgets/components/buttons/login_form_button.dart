import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/components/buttons/primary_button.dart';
import 'package:pms_admin/common/extensions/async_value_ui.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';

class LoginFormButton extends ConsumerWidget {
  const LoginFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (prev, state) {
      state.showSnackbarOnError(context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: const Text(
        "Ingresar",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final dto = LoginDto(
            username: _emailController.text,
            password: _passwordController.text,
          );

          await ref.read(authControllerProvider.notifier).login(dto);
        }
      },
    );
  }
}
