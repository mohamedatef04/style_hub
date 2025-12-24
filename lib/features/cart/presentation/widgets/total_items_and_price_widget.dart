import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/presentation/cubits/apply_coupon_cubit/apply_coupon_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_cart_products_cubit/get_cart_items_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class TotalItemsAndPriceWidget extends StatelessWidget {
  const TotalItemsAndPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
      builder: (context, state) {
        int totalItems = 0;
        double totalPrice = 0.0;
        double discount = 0.0;
        double finalTotal = totalPrice;

        if (state is GetCartItemsSuccessState) {
          totalItems = state.cartItems.length;
          for (var element in state.cartItems) {
            totalPrice += element.totalPrice;
            finalTotal = totalPrice - discount;
          }
        }
        return Column(
          children: [
            Row(
              children: [
                Text(
                  '${S.of(context).total} ($totalItems ${S.of(context).items}) : ',
                  style: AppTextStyles.semiBold16(context),
                ),
                const Spacer(),
                Text(
                  '\$ $totalPrice',
                  style: AppTextStyles.semiBold16(context),
                ),
              ],
            ),
            BlocBuilder<ApplyCouponCubit, ApplyCouponState>(
              builder: (context, state) {
                if (state is ApplyCouponSuccessState) {
                  discount = state.couponEntity.discountAmount;
                  finalTotal = state.couponEntity.finalTotal;
                }
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${S.of(context).discount} : ',
                          style: AppTextStyles.semiBold16(context),
                        ),
                        const Spacer(),
                        Text(
                          '$discount ',
                          style: AppTextStyles.semiBold16(context),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${S.of(context).finalTotal} : ',
                          style: AppTextStyles.semiBold16(context),
                        ),
                        const Spacer(),
                        Text(
                          '\$ $finalTotal',
                          style: AppTextStyles.semiBold16(context),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
