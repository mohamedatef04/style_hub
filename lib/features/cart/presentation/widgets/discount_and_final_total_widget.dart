import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/generated/l10n.dart';

class DiscountAndFinalTotalWidget extends StatelessWidget {
  const DiscountAndFinalTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '${S.of(context).discount} : ',
              style: AppTextStyles.semiBold16(context),
            ),
            const Spacer(),
            Text(
              '\$ 0',
              style: AppTextStyles.semiBold16(context),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '${S.of(context).finalTotal} : ',
              style: AppTextStyles.semiBold16(context),
            ),
            const Spacer(),
            Text(
              '\$ 627',
              style: AppTextStyles.semiBold16(context),
            ),
          ],
        ),
      ],
    );
  }
}
