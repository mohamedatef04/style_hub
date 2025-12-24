import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_cart_products_cubit/get_cart_items_cubit.dart';

class AppBarCartWidegt extends StatelessWidget {
  const AppBarCartWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
      builder: (context, state) {
        int count = 0;

        if (state is GetCartItemsSuccessState) {
          count = state.cartItems.length;
        }

        return Stack(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Transform.scale(
                  scale: 0.5,
                  child: Image.asset(Assets.imagesBagIcon),
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.black,
                child: Text(
                  '$count',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
