import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/features/auth/presentation/widgets/send_otp_for_reset_pass_button.dart';
import 'package:style_hub/generated/l10n.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  static const routeName = '/forget-password';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
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
                    S.of(context).forgotPassword,
                    style: AppTextStyles.bold25(context),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).emailValidation1;
                      } else if (!value.contains('@') ||
                          !value.contains('.com')) {
                        return S.of(context).emailValidation2;
                      }
                      return null;
                    },
                    label: S.of(context).email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: S.of(context).emailHint,
                  ),
                  SendOtpForResetPassButton(
                    formKey: formKey,
                    emailController: emailController,
                    onValid: () {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
