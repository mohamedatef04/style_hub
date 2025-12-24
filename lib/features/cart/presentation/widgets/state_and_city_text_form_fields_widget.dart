import 'package:flutter/material.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class StateAndCityTextFormFieldsWidget extends StatelessWidget {
  const StateAndCityTextFormFieldsWidget({
    super.key,
    required this.stateController,
    required this.cityController,
  });
  final TextEditingController stateController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: stateController,
            label: S.of(context).state,
            hintText: S.of(context).stateHint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).stateValidation1;
              } else if (value.length < 3) {
                return S.of(context).stateValidation2;
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            controller: cityController,
            label: S.of(context).city,
            hintText: S.of(context).cityHint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).cityValidation1;
              } else if (value.length < 3) {
                return S.of(context).cityValidation2;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
