import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class LoginPassTextFormFiled extends StatefulWidget {
  const LoginPassTextFormFiled({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  State<LoginPassTextFormFiled> createState() => _LoginPassTextFormFiledState();
}

class _LoginPassTextFormFiledState extends State<LoginPassTextFormFiled> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).passwordValidation1;
        }
        return null;
      },
      label: S.of(context).password,
      prefixIcon: const Icon(
        CupertinoIcons.lock,
        color: AppColors.orangeColor,
      ),
      obscureText: isPasswordVisible,
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: AppColors.orangeColor,
        ),
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
      hintText: S.of(context).passwordHint,
    );
  }
}
