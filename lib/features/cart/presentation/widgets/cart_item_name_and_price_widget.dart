import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartItemNameAndPriceWidget extends StatelessWidget {
  const CartItemNameAndPriceWidget({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            cartItemEntity.productName,
            maxLines: 1,
            style: AppTextStyles.semiBold16(context),
          ),
        ),
        Expanded(
          child: Text(
            'Stock - (${cartItemEntity.productStock})',
            style: AppTextStyles.regular14(context),
          ),
        ),

        Expanded(
          child: Text(
            '\$ ${cartItemEntity.totalPrice}',
            style: AppTextStyles.semiBold16(context),
          ),
        ),
      ],
    );
  }
}
