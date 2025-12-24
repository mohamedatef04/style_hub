import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';

class CustomTextBotton extends StatelessWidget {
  const CustomTextBotton({
    super.key,
    this.onPressed,
    this.height = 50,
    this.width = 150,
    this.child,
  });

  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(child: child),
        ),
      ),
    );
  }
}
