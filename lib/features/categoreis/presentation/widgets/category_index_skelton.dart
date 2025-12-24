import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIndexSkelton extends StatelessWidget {
  const CategoryIndexSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            width: 50.w,
            height: 50.h,
            color: Colors.grey[300],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            width: 40.w,
            height: 10.h,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
