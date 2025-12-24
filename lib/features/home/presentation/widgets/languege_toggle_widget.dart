import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_langs.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/presentation/widgets/languege_check_container.dart';
import 'package:style_hub/generated/l10n.dart';

class LanguegeToggleWidget extends StatefulWidget {
  const LanguegeToggleWidget({super.key});

  @override
  State<LanguegeToggleWidget> createState() => _LanguegeToggleWidgetState();
}

class _LanguegeToggleWidgetState extends State<LanguegeToggleWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(
                Icons.help,
                color: AppColors.blackColor,
                size: 20.sp,
              ),
            ),
            Text(
              S.of(context).appLanguage,
              style: AppTextStyles.semiBold16(context).copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 230, 230),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Expanded(
                  child: LanguegeCheckContainer(
                    title: S.of(context).english,
                    isSelected:
                        context.read<LanguegeToggleCubit>().state ==
                        AppLangs.getEnglishLang(),
                    onTap: () {
                      context.read<LanguegeToggleCubit>().toggleLanguege(
                        AppLangs.getEnglishLang(),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: LanguegeCheckContainer(
                    title: S.of(context).arabic,
                    isSelected:
                        context.read<LanguegeToggleCubit>().state ==
                        AppLangs.getArabicLang(),
                    onTap: () {
                      context.read<LanguegeToggleCubit>().toggleLanguege(
                        AppLangs.getArabicLang(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
