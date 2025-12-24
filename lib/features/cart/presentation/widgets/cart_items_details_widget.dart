import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/features/cart/presentation/widgets/check_out_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/coupon_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/total_items_and_price_widget.dart';

class CartItemsDetailsWidget extends StatelessWidget {
  const CartItemsDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),

      child: Container(
        width: double.infinity,
        height: 320.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Column(
            spacing: 10.h,
            children: const [
              CouponWidget(),
              TotalItemsAndPriceWidget(),
              CheckOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
