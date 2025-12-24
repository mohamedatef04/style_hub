import 'package:flutter/material.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class PhoneTextFormFieldWidget extends StatelessWidget {
  const PhoneTextFormFieldWidget({
    super.key,
    required this.phoneNumberController,
  });
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: phoneNumberController,
      label: S.of(context).phoneNumber,
      hintText: S.of(context).phoneNumberHint,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).phoneNumberValidation1;
        } else if (value.length < 11) {
          return S.of(context).phoneNumberValidation2;
        }
        return null;
      },
    );
  }
}
