import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_image_widget.dart';

class ItemDetailsHeaderWidget extends StatelessWidget {
  const ItemDetailsHeaderWidget({
    super.key,
    required this.collectionItemEntity,
  });
  final CollectionItemEntity collectionItemEntity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.5,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.whiteColor,
      leading: Container(
        margin: EdgeInsets.all(8.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          color: AppColors.blackColor,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ItemDetailsImageWidget(
          collectionItemEntity: collectionItemEntity,
        ),
      ),
    );
  }
}
