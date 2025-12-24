import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/presentation/widgets/edit_address_icon_wiget.dart';
import 'package:style_hub/features/cart/presentation/widgets/remove_address_widget.dart';

class MyAddressItemWidget extends StatelessWidget {
  const MyAddressItemWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: Text(
                '${addressEntity.street}\n/${addressEntity.state}/${addressEntity.city}',
                style: AppTextStyles.regular14(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
            ),

            Row(
              children: [
                EditAddressIconWidget(addressEntity: addressEntity),
                RemoveAddressWidget(addressEntity: addressEntity),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
