import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/services/google_auth_service.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:style_hub/features/auth/presentation/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:style_hub/features/auth/presentation/widgets/dont_have_an_account_widget.dart';
import 'package:style_hub/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:style_hub/features/auth/presentation/widgets/login_email_text_form_field.dart';
import 'package:style_hub/features/auth/presentation/widgets/login_pass_text_form_filed.dart';
import 'package:style_hub/features/auth/presentation/widgets/sign_in_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(
        getIt<GoogleSignInUseCase>(),
        getIt<GoogleAuthService>(),
      ),
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    spacing: 10.h,
                    children: [
                      SizedBox(height: 100.h),
                      Column(
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset(
                                Assets.imagesLogo1,
                                width: 100.w,
                              ),
                              SvgPicture.asset(
                                Assets.imagesLogo2,
                                width: 100.w,
                              ),
                            ],
                          ),
                          Text(
                            S.of(context).loginWelcomeMessage,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold25(context),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          LoginEmailTextFormField(
                            emailController: emailController,
                          ),
                          LoginPassTextFormFiled(
                            passwordController: passwordController,
                          ),
                          const ForgetPasswordWidget(),
                        ],
                      ),
                      SignInBotton(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        onValid: () {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        },
                      ),

                      const DontHaveAnAccountWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
