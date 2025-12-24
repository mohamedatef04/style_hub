import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/generated/l10n.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
        Text(
          S.of(context).orContinueWith,
          style: AppTextStyles.semiBold18(context).copyWith(color: Colors.grey),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
