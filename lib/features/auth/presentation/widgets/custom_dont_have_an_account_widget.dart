import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/views/register_view.dart';

class CustomDontHaveAnAccountWidget extends StatelessWidget {
  const CustomDontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTextStyles.semiBold18(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RegisterView.routeName);
          },
          child: Text(
            'Create a New Account',
            style: AppTextStyles.regular16(context),
          ),
        ),
      ],
    );
  }
}
