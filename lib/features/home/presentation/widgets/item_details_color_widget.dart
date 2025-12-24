import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/generated/l10n.dart';

class ItemDetailsColorWidget extends StatelessWidget {
  const ItemDetailsColorWidget({super.key, required this.collectionItemEntity});
  final CollectionItemEntity collectionItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${S.of(context).color}: ',
          style: AppTextStyles.bold16(context).copyWith(
            color: AppColors.blackColor,
          ),
        ),
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: _getColor(collectionItemEntity.color),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          collectionItemEntity.color,
          style: AppTextStyles.semiBold16(context),
        ),
      ],
    );
  }

  Color _getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'grey':
        return Colors.grey;
      case 'brown':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}
