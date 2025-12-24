import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/views/item_details_view.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_bottom_sheet.dart';

class CustomPriceAndAddToCartWidget extends StatelessWidget {
  const CustomPriceAndAddToCartWidget({
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
        Expanded(
          flex: 2,
          child: Text(
            '\$ ${collectionItemEntity.price}',
            style: AppTextStyles.regular16(context),
          ),
        ),

        Expanded(
          child: Container(
            width: 60.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              gradient: const LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
              ),
            ),
            child: Transform.scale(
              scale: 0.7,
              child: GestureDetector(
                onTap: () {
                  showItemDetailsBottomSheet(
                    context,
                    image: collectionItemEntity.coverPictureUrl,
                    title: currentLanguege == AppLangs.getEnglishLang()
                        ? collectionItemEntity.name
                        : collectionItemEntity.arabicName,
                    price: collectionItemEntity.price.toString(),
                    onTap: () => GoRouter.of(context).push(
                      ItemDetailsView.routeName,
                      extra: collectionItemEntity,
                    ),
                    addToCart: () => context.read<AddToCartCubit>().addToCart(
                      productId: collectionItemEntity.id,
                      quantity: 1,
                    ),
                  );
                },
                child: Image.asset(
                  Assets.imagesShoppingBagGold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
