import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/presentation/cubits/verify_email_cubit/verify_email_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SubmitOtpWidgetForVerifyEmailView extends StatelessWidget {
  const SubmitOtpWidgetForVerifyEmailView({
    super.key,
    required this.email,
    required this.getOtpCode,
  });
  final String email;
  final String Function() getOtpCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccessState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).success,
                message: S.of(context).emailVerified,
                contentType: ContentType.success,
              ),
            );
          GoRouter.of(context).go(SignInView.routeName);
        } else if (state is VerifyEmailErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).error,
                message: state.message,
                contentType: ContentType.failure,
              ),
            );
        }
      },
      builder: (context, state) {
        return CustomTextBotton(
          onPressed: () {
            final otpCode = getOtpCode();
            if (otpCode.length == 6) {
              context.read<VerifyEmailCubit>().verifyEmail(
                email: email,
                otp: otpCode,
              );
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  showSnackBar(
                    title: S.of(context).error,
                    message: S.of(context).otpValidation,
                    contentType: ContentType.failure,
                  ),
                );
            }
          },
          child: state is VerifyEmailLoadingState
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(
                  S.of(context).submit,
                  style: AppTextStyles.bold16(context),
                ),
        );
      },
    );
  }
}
