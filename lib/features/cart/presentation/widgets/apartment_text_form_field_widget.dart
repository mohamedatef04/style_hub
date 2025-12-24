import 'package:flutter/material.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class ApartmentTextFormFieldWidget extends StatelessWidget {
  const ApartmentTextFormFieldWidget({
    super.key,
    required this.apartmentController,
  });
  final TextEditingController apartmentController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: apartmentController,
      label: S.of(context).apartment,
      hintText: S.of(context).apartmentHint,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).apartmentValidation1;
        }
        return null;
      },
    );
  }
}
