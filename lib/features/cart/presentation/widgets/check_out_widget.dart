import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/presentation/views/checkout_view.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextBotton(
      width: MediaQuery.sizeOf(context).width,
      child: Text(
        S.of(context).checkout,
        style: AppTextStyles.bold16(context),
      ),
      onPressed: () {
        GoRouter.of(context).push(CheckoutView.routeName);
      },
    );
  }
}
