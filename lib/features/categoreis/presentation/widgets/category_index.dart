import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';

class CategoryIndex extends StatelessWidget {
  const CategoryIndex({
    super.key,
    required this.categoryEntity,
    this.onTap,
    required this.isSelected,
  });
  final CategoryEntity categoryEntity;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: isSelected
                ? AppColors.primaryColor
                : AppColors.lightGreyColor,
            child:
                categoryEntity.image != null &&
                    categoryEntity.image!.isNotEmpty &&
                    categoryEntity.image!.endsWith(".svg")
                ? SvgPicture.network(
                    categoryEntity.image!,
                    width: 40.w,
                  )
                : const Icon(
                    Icons.category,
                    color: AppColors.whiteColor,
                  ),
          ),
          Text(
            categoryEntity.name ?? "",
            style: AppTextStyles.regular12(context),
          ),
        ],
      ),
    );
  }
}
