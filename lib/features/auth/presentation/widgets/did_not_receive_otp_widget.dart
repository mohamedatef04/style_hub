import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/presentation/cubits/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class DidNotReceiveOtpWidget extends StatelessWidget {
  const DidNotReceiveOtpWidget({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).didntReceiveCode,
          style: AppTextStyles.regular16(context),
        ),
        BlocConsumer<ResendOtpCubit, ResendOtpState>(
          listener: (context, state) {
            if (state is ResendOtpSuccessState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  showSnackBar(
                    title: S.of(context).success,
                    message: S.of(context).enterNewPassword,
                    contentType: ContentType.success,
                  ),
                );
            } else if (state is ResendOtpFailureState) {
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
            return GestureDetector(
              onTap: () {
                context.read<ResendOtpCubit>().resendOtp(email: email);
              },
              child: state is ResendOtpLoadingState
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : Text(
                      S.of(context).resendCode,
                      style: AppTextStyles.regular16(context).copyWith(
                        color: AppColors.orangeColor,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
