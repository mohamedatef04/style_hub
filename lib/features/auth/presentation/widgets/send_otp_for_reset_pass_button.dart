import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/presentation/cubits/send_email_for_reset_pass_cubit/send_email_for_resetting_password_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/validate_otp_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SendOtpForResetPassButton extends StatefulWidget {
  const SendOtpForResetPassButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.onValid,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onValid;

  @override
  State<SendOtpForResetPassButton> createState() =>
      _SendOtpForResetPassButtonState();
}

class _SendOtpForResetPassButtonState extends State<SendOtpForResetPassButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      SendEmailForResettingPasswordCubit,
      SendEmailForResettingPasswordState
    >(
      listener: (context, state) {
        if (state is SendEmailForResettingPasswordSuccessState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).success,
                message: S.of(context).checkYourEmail,
                contentType: ContentType.success,
              ),
            );
          GoRouter.of(context).push(
            ValidateOtpView.routeName,
            extra: widget.emailController.text.trim(),
          );
        } else if (state is SendEmailForResettingPasswordErrorState) {
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
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              context
                  .read<SendEmailForResettingPasswordCubit>()
                  .sendEmailForResettingPassword(
                    email: widget.emailController.text.trim(),
                  );
            } else {
              setState(() {
                widget.onValid();
              });
            }
          },
          child: state is SendEmailForResettingPasswordLoadingState
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(
                  S.of(context).sendOtp,
                  style: AppTextStyles.bold16(context),
                ),
        );
      },
    );
  }
}
