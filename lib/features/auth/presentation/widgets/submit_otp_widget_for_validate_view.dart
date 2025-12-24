import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/data/models/reset_pass_args.dart';
import 'package:style_hub/features/auth/presentation/cubits/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/reset_password_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SubmitOtpWidgetForValidateView extends StatelessWidget {
  const SubmitOtpWidgetForValidateView({
    super.key,

    required this.email,
    required this.getOtp,
  });
  final String Function() getOtp;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
      listener: (context, state) {
        if (state is ValidateOtpSuccessState) {
          GoRouter.of(context).push(
            ResetPasswordView.routeName,
            extra: ResetPassArgs(
              email: email,
              otp: getOtp(),
            ),
          );
        } else if (state is ValidateOtpErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).error,
                message: state.errorMessage,
                contentType: ContentType.failure,
              ),
            );
        }
      },
      builder: (context, state) {
        return CustomTextBotton(
          onPressed: () {
            final currentOtp = getOtp();
            if (currentOtp.length == 6) {
              context.read<ValidateOtpCubit>().validateOtp(
                otp: currentOtp,
                email: email,
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
          child: state is ValidateOtpLoadingState
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
