import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    this.maxLines = 1,
    this.fillColor = AppColors.lightGreyColor,
    this.label,
  });
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final Color? fillColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(
          label ?? '',
          style: AppTextStyles.regular16(
            context,
          ).copyWith(color: AppColors.orangeColor),
        ),

        fillColor: fillColor,
        filled: true,
        hintStyle: const TextStyle(color: AppColors.darkGreyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
