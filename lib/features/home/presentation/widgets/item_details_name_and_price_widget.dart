import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

class ItemDetailsNameAndPriceWidget extends StatelessWidget {
  const ItemDetailsNameAndPriceWidget({
    super.key,
    required this.collectionItemEntity,
    required this.currentLanguege,
  });
  final CollectionItemEntity collectionItemEntity;
  final Locale currentLanguege;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            currentLanguege == AppLangs.getEnglishLang()
                ? collectionItemEntity.name
                : collectionItemEntity.arabicName,
            style: AppTextStyles.bold25(context).copyWith(
              color: AppColors.blackColor,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          '\$${collectionItemEntity.price}',
          style: AppTextStyles.bold25(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
