import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/constants/constants.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';

abstract class AppTextStyles {
  static TextStyle bold30(BuildContext context) => TextStyle(
    fontSize: 30.sp,
    color: AppColors.blackColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold20(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    color: AppColors.whiteColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold25(BuildContext context) => TextStyle(
    fontSize: 25.sp,
    color: AppColors.blackColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold16(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    color: AppColors.whiteColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.bold,
  );
  static TextStyle semiBold18(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    color: AppColors.blackColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold16(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    color: AppColors.blackColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle regular16(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    color: AppColors.darkGreyColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular12(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    color: AppColors.darkGreyColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular14(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontFamily:
        context.watch<LanguegeToggleCubit>().state == AppLangs.getEnglishLang()
        ? Constants.enFontFamily
        : Constants.arFontFamily,
    fontWeight: FontWeight.w400,
  );
}
