import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/decrement_cart_item_quantity_cubit/decrement_cart_item_quantity_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_cart_products_cubit/get_cart_items_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class CartItemIncrementAndDecrementWidget extends StatelessWidget {
  const CartItemIncrementAndDecrementWidget({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state is AddToCartSuccessState) {
              context.read<GetCartItemsCubit>().getCartItems();
            } else if (state is AddToCartErrorState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  showSnackBar(
                    title: S.of(context).error,
                    message: state.errorMessage,
                    contentType: ContentType.failure,
                  ),
                );
            }
          },
        ),
      ],
      child:
          BlocConsumer<
            DecrementCartItemQuantityCubit,
            DecrementCartItemQuantityState
          >(
            listener: (context, state) {
              if (state is DecrementCartItemQuantitySuccessState) {
                context.read<GetCartItemsCubit>().getCartItems();
              } else if (state is DecrementCartItemQuantityErrorState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    showSnackBar(
                      title: S.of(context).error,
                      message: state.errorMessage,
                      contentType: ContentType.failure,
                    ),
                  );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.lightGreyColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (cartItemEntity.quantity > 1) {
                              context
                                  .read<DecrementCartItemQuantityCubit>()
                                  .decrementCartItemQuantity(
                                    productId: cartItemEntity.itemId,
                                  );
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 15.sp,
                          ),
                        ),
                        Text(
                          cartItemEntity.quantity.toString(),
                          style: AppTextStyles.semiBold16(context),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<AddToCartCubit>().addToCart(
                              productId: cartItemEntity.productId,
                              quantity: 1,
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}
