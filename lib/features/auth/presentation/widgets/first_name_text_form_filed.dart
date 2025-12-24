import 'package:flutter/cupertino.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class FirstNameTextFormFiled extends StatelessWidget {
  const FirstNameTextFormFiled({super.key, required this.firstNameController});
  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: firstNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).firstNameValidation;
        }
        return null;
      },
      label: S.of(context).firstName,
      prefixIcon: const Icon(
        CupertinoIcons.person,
        color: AppColors.orangeColor,
      ),
      hintText: S.of(context).firstNameHint,
    );
  }
}
