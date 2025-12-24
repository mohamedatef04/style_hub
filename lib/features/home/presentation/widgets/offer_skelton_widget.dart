import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferSkeltonWidget extends StatelessWidget {
  const OfferSkeltonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 180.h,
        color: Colors.grey[300],
      ),
    );
  }
}
