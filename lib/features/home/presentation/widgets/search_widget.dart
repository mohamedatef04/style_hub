import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomTextFormField(
        fillColor: AppColors.lightGreyColor,
        hintText: S.of(context).searchHint,
        label: S.of(context).search,
        onChanged: onChanged,

        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.darkGreyColor,
        ),
      ),
    );
  }
}
