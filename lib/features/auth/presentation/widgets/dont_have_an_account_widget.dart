import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/views/register_view.dart';
import 'package:style_hub/generated/l10n.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: AppTextStyles.semiBold18(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RegisterView.routeName);
          },
          child: Text(
            S.of(context).signUp,
            style: AppTextStyles.regular16(context).copyWith(
              color: AppColors.orangeColor,
            ),
          ),
        ),
      ],
    );
  }
}
