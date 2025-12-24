import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/presentation/cubits/remove_cart_item_cubit/remove_cart_item_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_item_image_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_item_increment_and_decrement_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_item_name_and_price_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/dismissible_back_ground_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItemEntity.itemId),
      direction: DismissDirection.endToStart,
      background: const DismissibleBackGroundWidget(),
      onDismissed: (direction) {
        context.read<RemoveCartItemCubit>().removeCartItem(
          productId: cartItemEntity.productId,
          itemId: cartItemEntity.itemId,
        );
      },
      child: Card.outlined(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              spacing: 5.w,
              children: [
                Expanded(
                  flex: 2,
                  child: CartItemImageWidget(
                    cartItemEntity: cartItemEntity,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CartItemNameAndPriceWidget(
                    cartItemEntity: cartItemEntity,
                  ),
                ),
                CartItemIncrementAndDecrementWidget(
                  cartItemEntity: cartItemEntity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
