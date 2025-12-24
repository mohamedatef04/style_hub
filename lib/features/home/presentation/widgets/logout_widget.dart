import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:style_hub/generated/l10n.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          GoRouter.of(context).go(SignInView.routeName);
        } else if (state is LogoutFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<LogoutCubit>().logout();
          },
          child: Row(
            children: [
              const Icon(Icons.logout),
              Text(
                S.of(context).logout,
                style: AppTextStyles.semiBold16(context).copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
