import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class RegisterEmailTextFormFiled extends StatelessWidget {
  const RegisterEmailTextFormFiled({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).emailValidation1;
        } else if (!value.contains('@') || !value.contains('.com')) {
          return S.of(context).emailValidation2;
        }
        return null;
      },
      label: S.of(context).email,
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: AppColors.orangeColor,
      ),
      hintText: S.of(context).emailHint,
    );
  }
}
