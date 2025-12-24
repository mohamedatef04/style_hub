import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';

class LanguegeCheckContainer extends StatelessWidget {
  const LanguegeCheckContainer({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
  });
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.whiteColor
              : const Color.fromARGB(255, 233, 230, 230),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.language,
              color: AppColors.blackColor,
            ),
            Text(
              title,
              style: AppTextStyles.semiBold16(context).copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
