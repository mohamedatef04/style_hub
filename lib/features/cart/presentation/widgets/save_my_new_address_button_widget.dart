import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_my_addresses_cubit/get_my_addresses_cubit.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class SaveMyNewAddressButtonWidget extends StatefulWidget {
  const SaveMyNewAddressButtonWidget({
    super.key,
    required this.stateController,
    required this.cityController,
    required this.streetController,
    required this.apartmentController,
    required this.phoneNumberController,
    required this.notesController,
    required this.formKey,
  });
  final TextEditingController stateController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController apartmentController;
  final TextEditingController phoneNumberController;
  final TextEditingController notesController;
  final GlobalKey<FormState> formKey;

  @override
  State<SaveMyNewAddressButtonWidget> createState() =>
      _SaveMyNewAddressWidgetState();
}

class _SaveMyNewAddressWidgetState extends State<SaveMyNewAddressButtonWidget> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewAddressCubit, AddNewAddressState>(
      listener: (context, state) {
        if (state is AddNewAddressSuccessState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).success,
                message: S.of(context).addressAdded,
                contentType: ContentType.success,
              ),
            );
          widget.stateController.clear();
          widget.cityController.clear();
          widget.streetController.clear();
          widget.apartmentController.clear();
          widget.phoneNumberController.clear();
          widget.notesController.clear();
          context.read<GetMyAddressesCubit>().getMyAddresses();
        } else if (state is AddNewAddressErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).error,
                message: state.errorMessage,
                contentType: ContentType.failure,
              ),
            );
        }
      },
      builder: (context, state) {
        return CustomTextBotton(
          width: MediaQuery.sizeOf(context).width,
          child: state is AddNewAddressLoadingState
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  S.of(context).save,
                  style: AppTextStyles.bold16(context),
                ),
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              context.read<AddNewAddressCubit>().addNewAddress(
                addressEntity: AddressEntity(
                  state: widget.stateController.text.trim(),
                  city: widget.cityController.text.trim(),
                  street: widget.streetController.text.trim(),
                  apartment: widget.apartmentController.text.trim(),
                  phoneNumber: widget.phoneNumberController.text.trim(),
                  notes: widget.notesController.text.trim(),
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
    );
  }
}
