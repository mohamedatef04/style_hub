import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/views/forget_password_view.dart';
import 'package:style_hub/generated/l10n.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          ForgetPasswordView.routeName,
        );
      },
      child: Text(
        S.of(context).forgotPassword,
        style: AppTextStyles.regular16(
          context,
        ),
      ),
    );
  }
}
