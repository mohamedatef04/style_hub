import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/features/cart/presentation/widgets/apartment_text_form_field_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/phone_text_form_field_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/save_my_new_address_button_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/state_and_city_text_form_fields_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/street_text_form_field_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class AddNewAddressWidget extends StatefulWidget {
  const AddNewAddressWidget({super.key});

  @override
  State<AddNewAddressWidget> createState() => _AddNewAddressWidgetState();
}

class _AddNewAddressWidgetState extends State<AddNewAddressWidget> {
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            S.of(context).addNewAddress,
            style: AppTextStyles.bold20(
              context,
            ).copyWith(color: AppColors.blackColor),
          ),
          StateAndCityTextFormFieldsWidget(
            stateController: stateController,
            cityController: cityController,
          ),
          StreetTextFormFieldWidget(
            streetController: streetController,
          ),
          ApartmentTextFormFieldWidget(
            apartmentController: apartmentController,
          ),
          PhoneTextFormFieldWidget(
            phoneNumberController: phoneNumberController,
          ),

          CustomTextFormField(
            controller: notesController,
            label: S.of(context).notes,
            hintText: S.of(context).notesHint,
          ),
          SaveMyNewAddressButtonWidget(
            stateController: stateController,
            cityController: cityController,
            streetController: streetController,
            apartmentController: apartmentController,
            phoneNumberController: phoneNumberController,
            notesController: notesController,
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}
