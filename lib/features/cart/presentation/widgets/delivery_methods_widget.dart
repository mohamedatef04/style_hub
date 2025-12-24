import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/presentation/views/my_addresses_view.dart';
import 'package:style_hub/features/cart/presentation/widgets/all_addresses_list_view.dart';
import 'package:style_hub/generated/l10n.dart';

class DeliveryMethodsWidget extends StatelessWidget {
  const DeliveryMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          children: [
            Text(
              S.of(context).deliveryMethod,
              style: AppTextStyles.semiBold16(context),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(MyAddressesView.routeName);
              },
              child: Text(
                S.of(context).addEditAddress,
                style: AppTextStyles.regular14(context),
              ),
            ),
          ],
        ),
        const AllAddressesList(),
      ],
    );
  }
}
