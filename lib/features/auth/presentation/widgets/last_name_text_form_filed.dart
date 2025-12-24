import 'package:flutter/cupertino.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/generated/l10n.dart';

class LastNameTextFormFiled extends StatelessWidget {
  const LastNameTextFormFiled({super.key, required this.lastNameController});
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: lastNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).lastNameValidation;
        }
        return null;
      },
      label: S.of(context).lastName,
      prefixIcon: const Icon(
        CupertinoIcons.person,
        color: AppColors.orangeColor,
      ),
      hintText: S.of(context).lastNameHint,
    );
  }
}
