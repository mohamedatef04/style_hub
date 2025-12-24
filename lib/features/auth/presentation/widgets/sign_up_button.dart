import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';
import 'package:style_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/verify_email_after_register_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.onValid,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onValid;

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          GoRouter.of(
            context,
          ).push(
            VerifyEmailAfterRegisterView.routeName,
            extra: widget.emailController.text.trim(),
          );
        } else if (state is RegisterErrorState) {
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
          child: state is RegisterLoadingState
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(
                  S.of(context).signUp,
                  style: AppTextStyles.bold16(context),
                ),
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              context.read<RegisterCubit>().register(
                registerRequestEntity: RegisterRequestEntity(
                  userFirstName: widget.firstNameController.text.trim(),
                  userLastName: widget.lastNameController.text.trim(),
                  userEmail: widget.emailController.text.trim(),
                  userPassword: widget.passwordController.text.trim(),
                ),
              );
            } else {
              setState(() {
                widget.onValid();
              });
            }
          },
        );
      },
    );
  }
}
