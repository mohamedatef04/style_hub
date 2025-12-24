import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/presentation/widgets/show_edit_address_bottom_sheet.dart';
import 'package:style_hub/generated/l10n.dart';

class EditAddressIconWidget extends StatelessWidget {
  const EditAddressIconWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showEditAddressBottomSheet(context, addressEntity);
          },
          icon: const Icon(
            Icons.edit,
            size: 20,
          ),
        ),
        Text(
          S.of(context).edit,
          style: AppTextStyles.regular14(context),
        ),
      ],
    );
  }
}
