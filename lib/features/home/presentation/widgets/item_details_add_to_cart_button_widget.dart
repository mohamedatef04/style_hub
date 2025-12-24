import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/core/widgets/quantity_selector_widget.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/generated/l10n.dart';

class ItemDetailsAddToCartButtonWidget extends StatefulWidget {
  const ItemDetailsAddToCartButtonWidget({
    super.key,
    required this.collectionItemEntity,
  });
  final CollectionItemEntity collectionItemEntity;

  @override
  State<ItemDetailsAddToCartButtonWidget> createState() =>
      _ItemDetailsAddToCartButtonWidgetState();
}

class _ItemDetailsAddToCartButtonWidgetState
    extends State<ItemDetailsAddToCartButtonWidget> {
  int _selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Quantity selector row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).quantity,
                  style: AppTextStyles.semiBold16(context),
                ),
                QuantitySelectorWidget(
                  initialQuantity: _selectedQuantity,
                  onQuantityChanged: (quantity) {
                    setState(() {
                      _selectedQuantity = quantity;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Add to cart button
            BlocConsumer<AddToCartCubit, AddToCartState>(
              listener: (context, state) {
                if (state is AddToCartSuccessState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      showSnackBar(
                        title: S.of(context).success,
                        message: S.of(context).addedToCartSuccess,
                        contentType: ContentType.success,
                      ),
                    );
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
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state is AddToCartLoadingState
                        ? null
                        : () {
                            context.read<AddToCartCubit>().addToCart(
                              productId: widget.collectionItemEntity.id,
                              quantity: _selectedQuantity,
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: state is AddToCartLoadingState
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : Text(
                            '${S.of(context).addToCart} - \$${(widget.collectionItemEntity.price * _selectedQuantity).toStringAsFixed(2)}',
                            style: AppTextStyles.bold16(
                              context,
                            ).copyWith(color: Colors.white),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
