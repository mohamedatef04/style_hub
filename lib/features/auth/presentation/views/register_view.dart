import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/presentation/widgets/already_have_an_account_widget.dart';
import 'package:style_hub/features/auth/presentation/widgets/first_name_text_form_filed.dart';
import 'package:style_hub/features/auth/presentation/widgets/last_name_text_form_filed.dart';
import 'package:style_hub/features/auth/presentation/widgets/register_email_text_form_filed.dart';
import 'package:style_hub/features/auth/presentation/widgets/register_pass_text_form_filed.dart';
import 'package:style_hub/features/auth/presentation/widgets/sign_up_button.dart';
import 'package:style_hub/generated/l10n.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
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
                    SizedBox(height: 50.h),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          Assets.imagesLogo1,
                          width: 100.w,
                        ),
                        SvgPicture.asset(Assets.imagesLogo2, width: 100.w),
                      ],
                    ),
                    Text(
                      S.of(context).registerWelcomeMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bold25(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.h,
                      children: [
                        FirstNameTextFormFiled(
                          firstNameController: firstNameController,
                        ),
                        LastNameTextFormFiled(
                          lastNameController: lastNameController,
                        ),
                        RegisterEmailTextFormFiled(
                          emailController: emailController,
                        ),
                        RegisterPassTextFormFiled(
                          passwordController: passwordController,
                        ),
                      ],
                    ),
                    SignUpButton(
                      formKey: formKey,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      onValid: () {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      },
                    ),

                    const AlreadyHaveAnAccountWidget(),

                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
