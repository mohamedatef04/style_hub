import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/data/models/reset_pass_args.dart';
import 'package:style_hub/features/auth/presentation/cubits/reset_pass_cubit/reset_password_cubit.dart';
import 'package:style_hub/features/auth/presentation/widgets/show_custom_bottom_sheet_widget.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class ResetPassButton extends StatefulWidget {
  const ResetPassButton({
    super.key,
    required this.formKey,
    required this.onValid,
    required this.resetPassArgs,
    required this.passwordController,
  });
  final GlobalKey<FormState> formKey;
  final ResetPassArgs resetPassArgs;
  final TextEditingController passwordController;
  final VoidCallback onValid;

  @override
  State<ResetPassButton> createState() => _ResetPassButtonState();
}

class _ResetPassButtonState extends State<ResetPassButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showCustomBottomSheet(context);
        } else if (state is ResetPasswordErrorState) {
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
              context.read<ResetPasswordCubit>().resetPassword(
                email: widget.resetPassArgs.email,
                otp: widget.resetPassArgs.otp,
                password: widget.passwordController.text.trim(),
              );
            } else {
              setState(() {
                widget.onValid();
              });
            }
          },
          child: state is ResetPasswordLoadingState
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(S.of(context).reset, style: AppTextStyles.bold16(context)),
        );
      },
    );
  }
}
