import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/generated/l10n.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: AppTextStyles.semiBold18(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            S.of(context).signIn,
            style: AppTextStyles.regular16(context).copyWith(
              color: AppColors.orangeColor,
            ),
          ),
        ),
      ],
    );
  }
}
