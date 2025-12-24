import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/constants/constants.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/features/root/presentation/views/root_view.dart';
import 'package:style_hub/generated/l10n.dart';

class SignInBotton extends StatefulWidget {
  const SignInBotton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onValid,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onValid;

  @override
  State<SignInBotton> createState() => _SignInBottonState();
}

class _SignInBottonState extends State<SignInBotton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          const storage = FlutterSecureStorage();
          final data = state.loginResponseEntity;

          await storage.write(
            key: Constants.accessToken,
            value: data.accessToken,
          );
          await storage.write(
            key: Constants.refreshToken,
            value: data.refreshToken,
          );

          GoRouter.of(context).pushReplacement(RootView.routeName);
        } else if (state is LoginErrorState) {
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
              context.read<LoginCubit>().login(
                email: widget.emailController.text.trim(),
                password: widget.passwordController.text.trim(),
              );
            } else {
              setState(() {
                widget.onValid();
              });
            }
          },
          child: state is LoginLoadingState
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(
                  S.of(context).signIn,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold16(context),
                ),
        );
      },
    );
  }
}
