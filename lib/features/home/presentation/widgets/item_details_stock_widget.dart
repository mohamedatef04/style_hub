import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/generated/l10n.dart';

class ItemDetailsStockWidget extends StatelessWidget {
  const ItemDetailsStockWidget({super.key, required this.collectionItemEntity});
  final CollectionItemEntity collectionItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Text(
              S.of(context).stock,
              style: AppTextStyles.bold16(context).copyWith(
                color: AppColors.orangeColor,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15.w,
                  height: 15.w,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  collectionItemEntity.stock.toString(),
                  style: AppTextStyles.bold16(context).copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
