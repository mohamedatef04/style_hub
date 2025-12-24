import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/generated/l10n.dart';

class ItemDetailsCategoryAndStockWidget extends StatelessWidget {
  const ItemDetailsCategoryAndStockWidget({
    super.key,
    required this.collectionItemEntity,
    required this.currentLanguege,
  });
  final CollectionItemEntity collectionItemEntity;
  final Locale currentLanguege;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.category_outlined,
                size: 16.sp,
                color: Colors.grey.shade700,
              ),
              SizedBox(width: 6.w),
              Text(
                collectionItemEntity.categories.isNotEmpty
                    ? collectionItemEntity.categories.first
                    : '',
                style: AppTextStyles.regular14(context).copyWith(
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        if (collectionItemEntity.stock > 0)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              '${S.of(context).stock}: ${collectionItemEntity.stock}',
              style: AppTextStyles.regular14(context).copyWith(
                color: Colors.green.shade700,
              ),
            ),
          )
        else
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'Out of Stock',
              style: AppTextStyles.regular14(context).copyWith(
                color: Colors.red.shade700,
              ),
            ),
          ),
      ],
    );
  }
}
