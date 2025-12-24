import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/home/presentation/widgets/custom_listtile.dart';

class HomeHeaderShapeWidget extends StatelessWidget {
  const HomeHeaderShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double responsiveHeight = MediaQuery.sizeOf(context).height * 0.25;

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: responsiveHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            color: AppColors.whiteColor,
            gradient: const LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const CustomListtile(),
      ],
    );
  }
}
