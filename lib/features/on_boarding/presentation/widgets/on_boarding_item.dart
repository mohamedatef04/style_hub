import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/on_boarding/models/on_boarding_item_model.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.onBoardingItemModel,
    this.onPressed,
    required this.pageController,
  });
  final OnBoardingItemModel onBoardingItemModel;
  final void Function()? onPressed;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 10.h,
        children: [
          Expanded(flex: 6, child: Image.asset(onBoardingItemModel.image)),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Text(
                    onBoardingItemModel.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold30(context),
                  ),
                  Text(
                    onBoardingItemModel.description,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular16(context),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                CustomTextBotton(
                  onPressed: onPressed,
                  child: Text(
                    onBoardingItemModel.buttonText,
                    style: AppTextStyles.bold16(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
