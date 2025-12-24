import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/presentation/widgets/did_not_receive_otp_widget.dart';
import 'package:style_hub/features/auth/presentation/widgets/otp_widget.dart';
import 'package:style_hub/features/auth/presentation/widgets/submit_otp_widget_for_validate_view.dart';
import 'package:style_hub/generated/l10n.dart';

class ValidateOtpView extends StatefulWidget {
  const ValidateOtpView({super.key, required this.email});

  static const routeName = '/enter-otp';
  final String email;

  @override
  State<ValidateOtpView> createState() => _ValidateOtpViewState();
}

class _ValidateOtpViewState extends State<ValidateOtpView> {
  String? otp;
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
      body: SafeArea(
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
                    S.of(context).enterOtpCode,
                    style: AppTextStyles.bold25(context),
                  ),
                  Text(
                    '${S.of(context).enterOtpMessage}(${widget.email})',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular16(context),
                  ),
                  OtpInputWidget(
                    onCompleted: (value) {
                      otp = value;
                    },
                    length: 6,
                  ),
                  DidNotReceiveOtpWidget(
                    email: widget.email,
                  ),

                  SubmitOtpWidgetForValidateView(
                    email: widget.email,
                    getOtp: () => otp ?? '',
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
