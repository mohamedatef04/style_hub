import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/views/item_details_view.dart';
import 'package:style_hub/features/home/presentation/widgets/custom_price_and_add_to_cart_widget.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({
    super.key,
    required this.collectionItemEntity,
  });
  final CollectionItemEntity collectionItemEntity;

  @override
  Widget build(BuildContext context) {
    final currentLanguege = context.watch<LanguegeToggleCubit>().state;
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(ItemDetailsView.routeName, extra: collectionItemEntity);
      },
      child: Card.outlined(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(color: Colors.grey),
            ],
            gradient: const LinearGradient(
              colors: [
                AppColors.lightGreyColor,
                AppColors.whiteColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: collectionItemEntity.coverPictureUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),

                Text(
                  currentLanguege == AppLangs.getEnglishLang()
                      ? collectionItemEntity.name
                      : collectionItemEntity.arabicName,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular16(context),
                ),
                CustomPriceAndAddToCartWidget(
                  collectionItemEntity: collectionItemEntity,
                  currentLanguege: currentLanguege,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
