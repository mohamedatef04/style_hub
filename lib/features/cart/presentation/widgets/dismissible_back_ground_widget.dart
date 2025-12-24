import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/utils/app_langs.dart';

class DismissibleBackGroundWidget extends StatelessWidget {
  const DismissibleBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLanguge = context.read<LanguegeToggleCubit>().state;
    return Container(
      alignment: currentLanguge == AppLangs.getEnglishLang()
          ? Alignment.centerRight
          : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.delete, color: Colors.white, size: 28),
    );
  }
}
