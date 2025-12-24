import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_address_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/update_address_cubit/update_address_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/apartment_text_form_field_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/edit_my_address_button_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/phone_text_form_field_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/state_and_city_text_form_fields_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/street_text_form_field_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class EditAddressWidget extends StatefulWidget {
  const EditAddressWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;

  @override
  State<EditAddressWidget> createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState extends State<EditAddressWidget> {
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    stateController.text = widget.addressEntity.state;
    cityController.text = widget.addressEntity.city;
    streetController.text = widget.addressEntity.street;
    apartmentController.text = widget.addressEntity.apartment;
    phoneNumberController.text = widget.addressEntity.phoneNumber;
    notesController.text = widget.addressEntity.notes ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateAddressCubit(getIt.get<UpdateAddressUseCase>()),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Column(
                spacing: 10.h,
                children: [
                  Text(
                    S.of(context).editAddress,
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
                ],
              ),

              Builder(
                builder: (context) {
                  return EditMyAddressButtonWidget(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<UpdateAddressCubit>().updateAddress(
                          addressEntity: AddressEntity(
                            id: widget.addressEntity.id,
                            state: stateController.text,
                            city: cityController.text,
                            street: streetController.text,
                            apartment: apartmentController.text,
                            phoneNumber: phoneNumberController.text,
                            notes: notesController.text,
                          ),
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
