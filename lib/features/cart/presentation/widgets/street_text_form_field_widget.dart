import 'package:flutter/material.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class StreetTextFormFieldWidget extends StatelessWidget {
  const StreetTextFormFieldWidget({super.key, required this.streetController});
  final TextEditingController streetController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: streetController,
      label: S.of(context).steet,
      hintText: S.of(context).steetHint,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).steetValidation1;
        } else if (value.length < 3) {
          return S.of(context).streetValidation2;
        }
        return null;
      },
    );
  }
}
