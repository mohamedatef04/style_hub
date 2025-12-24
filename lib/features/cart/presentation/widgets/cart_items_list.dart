import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_cart_products_cubit/get_cart_items_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_item.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_item_skelton.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
      builder: (context, state) {
        if (state is GetCartItemsSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CartItem(
                  cartItemEntity: state.cartItems[index],
                ),
              );
            },
          );
        } else if (state is GetCartItemsErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is GetCartItemsEmptyState) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesEmptyCart,
                  width: 200.w,
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  ignoreContainers: false,
                  child: CartItemSkelton(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
