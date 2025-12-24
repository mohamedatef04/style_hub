import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';

class QuantitySelectorWidget extends StatefulWidget {
  const QuantitySelectorWidget({
    super.key,
    this.initialQuantity = 1,
    this.minQuantity = 1,
    this.maxQuantity,
    this.onQuantityChanged,
  });

  final int initialQuantity;

  final int minQuantity;

  final int? maxQuantity;

  final ValueChanged<int>? onQuantityChanged;

  @override
  State<QuantitySelectorWidget> createState() => _QuantitySelectorWidgetState();
}

class _QuantitySelectorWidgetState extends State<QuantitySelectorWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    if (widget.maxQuantity == null || _quantity < widget.maxQuantity!) {
      setState(() {
        _quantity++;
      });
      widget.onQuantityChanged?.call(_quantity);
    }
  }

  void _decrement() {
    if (_quantity > widget.minQuantity) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged?.call(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.lightGreyColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: Icon(
              Icons.remove,
              color: _quantity <= widget.minQuantity
                  ? Colors.grey
                  : Colors.black,
              size: 15.sp,
            ),
          ),
          SizedBox(
            width: 30.w,
            child: Text(
              _quantity.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.bold16(context).copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ),
          IconButton(
            onPressed: _increment,
            icon: Icon(
              Icons.add,
              color:
                  widget.maxQuantity != null && _quantity >= widget.maxQuantity!
                  ? Colors.grey
                  : Colors.black,
              size: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
