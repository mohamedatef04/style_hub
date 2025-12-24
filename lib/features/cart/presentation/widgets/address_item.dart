import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressEntity,
    required this.isSelected,
    this.onTap,
  });

  final AddressEntity addressEntity;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${addressEntity.street}\n/${addressEntity.state}/${addressEntity.city}',
                style:
                    AppTextStyles.regular14(
                      context,
                    ).copyWith(
                      color: isSelected ? AppColors.whiteColor : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
