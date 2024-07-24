import 'package:flutter/material.dart';
import 'package:pms_admin/common/components/form_fields/text_form_field.dart';
import 'package:pms_admin/features/auth/presentation/widgets/components/buttons/login_form_button.dart';
import 'package:pms_admin/features/auth/presentation/widgets/validators/email_validator.dart';
import 'package:pms_admin/features/auth/presentation/widgets/validators/password_validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.teal,
          //         Color.fromARGB(255, 59, 111, 106),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(143, 0, 0, 0),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          const LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool obscuredPassword = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 600,
        maxWidth: 500,
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Sistema Gestor de Permisos - PFC",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Inicio de Sesión",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/escudo_normal.png',
                height: 200,
              ),
              OutlinedTextFormField(
                label: "Correo institucional",
                maxLines: 1,
                controller: _emailController,
                validator: emailValidator,
                borderColor: Theme.of(context).colorScheme.primary,
                prefixIcon: const Icon(
                  Icons.mail,
                  size: 25,
                ),
                autocorrect: true,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                label: "Contraseña",
                controller: _passwordController,
                validator: passwordValidator,
                obscureText: obscuredPassword,
                maxLines: 1,
                borderColor: Theme.of(context).colorScheme.primary,
                prefixIcon: const Icon(
                  Icons.password,
                  size: 25,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredPassword = !obscuredPassword;
                    });
                  },
                  icon: obscuredPassword
                      ? const Icon(
                          Icons.remove_red_eye,
                          size: 25,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 25,
                        ),
                ),
              ),
              const SizedBox(height: 30),
              LoginFormButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
