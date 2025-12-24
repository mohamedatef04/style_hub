import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 350.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 10.h,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              Text(
                S.of(context).passwordUpdated,
                textAlign: TextAlign.center,
                style: AppTextStyles.bold25(context),
              ),

              Text(
                S.of(context).passwordUpdatedMessage,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16(context),
              ),
              CustomTextBotton(
                width: double.infinity,

                onPressed: () {
                  GoRouter.of(context).go(SignInView.routeName);
                },
                child: Text(
                  S.of(context).backToLogin,
                  style: AppTextStyles.bold16(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
