import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms_admin/common/components/buttons/search_button.dart';

class OutlinedSearchBar extends StatelessWidget {
  final String? initialValue;
  final String label;
  final bool isNumberField;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isPassword;
  final double borderRadius;

  const OutlinedSearchBar({
    super.key,
    this.initialValue,
    required this.label,
    this.controller,
    this.isNumberField = false,
    this.validator,
    this.maxLines,
    this.isPassword = false,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: isPassword,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        isDense: true,
        label: Text(label),
        suffixIcon: SearchButton(
          onTap: () {},
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: .8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      inputFormatters: isNumberField
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
          : null,
      keyboardType: isNumberField ? TextInputType.number : TextInputType.text,
      validator: validator,
    );
  }
}
