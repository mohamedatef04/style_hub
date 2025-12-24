import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/data/models/reset_pass_args.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/features/auth/presentation/widgets/reset_pass_button.dart';
import 'package:style_hub/generated/l10n.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.resetPassArgs});
  static const routeName = '/reset-password';
  final ResetPassArgs resetPassArgs;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final passwordControoler = TextEditingController();
  final confirmPasswordControoler = TextEditingController();

  @override
  void dispose() {
    passwordControoler.dispose();
    confirmPasswordControoler.dispose();
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
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.h,
                  children: [
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
                      S.of(context).resetPassword,
                      style: AppTextStyles.bold25(context),
                    ),
                    CustomTextFormField(
                      controller: passwordControoler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).passwordValidation1;
                        } else if (!RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$',
                        ).hasMatch(value)) {
                          return S.of(context).passwordValidation2;
                        }
                        return null;
                      },
                      label: S.of(context).password,
                      prefixIcon: const Icon(Icons.lock_clock_outlined),
                      hintText: S.of(context).enterNewPassword,
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordControoler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).confirmPassword;
                        } else if (value != passwordControoler.text) {
                          return S.of(context).passwordDoesNotMatch;
                        } else {
                          return null;
                        }
                      },
                      label: S.of(context).confirmPassword,
                      prefixIcon: const Icon(Icons.lock_clock_outlined),
                      hintText: S.of(context).confirmPassword,
                    ),
                    ResetPassButton(
                      formKey: formKey,
                      onValid: () {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      },
                      resetPassArgs: widget.resetPassArgs,
                      passwordController: passwordControoler,
                    ),
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
