import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/generated/l10n.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          children: [
            Text(
              S.of(context).paymentMethod,
              style: AppTextStyles.semiBold16(context),
            ),
          ],
        ),
        Card.filled(
          elevation: 5,
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 150.h,

            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ],
    );
  }
}
