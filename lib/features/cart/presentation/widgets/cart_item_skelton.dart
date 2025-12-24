import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemSkelton extends StatelessWidget {
  const CartItemSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
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
            spacing: 10.w,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    width: 100.w,
                    height: 80.h,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        width: 100.w,
                        height: 15.h,
                        color: Colors.grey[300],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        width: 100.w,
                        height: 15.h,
                        color: Colors.grey[300],
                      ),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        width: 50.w,
                        height: 15.h,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        width: 100.w,
                        height: 20.h,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
