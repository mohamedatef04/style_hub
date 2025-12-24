import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_category_and_stock_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_color_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_name_and_price_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class ItemDetailsTrallingWidget extends StatefulWidget {
  const ItemDetailsTrallingWidget({
    super.key,
    required this.collectionItemEntity,
  });
  final CollectionItemEntity collectionItemEntity;

  @override
  State<ItemDetailsTrallingWidget> createState() =>
      _ItemDetailsTrallingWidgetState();
}

class _ItemDetailsTrallingWidgetState extends State<ItemDetailsTrallingWidget> {
  @override
  Widget build(BuildContext context) {
    final currentLanguege = context.watch<LanguegeToggleCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailsNameAndPriceWidget(
          collectionItemEntity: widget.collectionItemEntity,
          currentLanguege: currentLanguege,
        ),
        SizedBox(height: 8.h),
        ItemDetailsCategoryAndStockWidget(
          collectionItemEntity: widget.collectionItemEntity,
          currentLanguege: currentLanguege,
        ),
        SizedBox(height: 24.h),
        Text(
          S.of(context).description,
          style: AppTextStyles.semiBold18(context).copyWith(
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          currentLanguege == AppLangs.getEnglishLang()
              ? widget.collectionItemEntity.description
              : widget.collectionItemEntity.arabicDescription,
          style: AppTextStyles.regular16(context).copyWith(
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
        SizedBox(height: 24.h),
        ItemDetailsColorWidget(
          collectionItemEntity: widget.collectionItemEntity,
        ),
      ],
    );
  }
}
