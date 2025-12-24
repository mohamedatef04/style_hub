import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionItemSkelton extends StatelessWidget {
  const CollectionItemSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  color: Colors.grey[300],
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: double.infinity,
                  height: 16.h,
                  color: Colors.grey[300],
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: 80.w,
                  height: 16.h,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
