import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/presentation/cubits/update_address_cubit/update_address_cubit.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

class EditMyAddressButtonWidget extends StatelessWidget {
  const EditMyAddressButtonWidget({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAddressCubit, UpdateAddressState>(
      listener: (context, state) {
        if (state is UpdateAddressSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              showSnackBar(
                title: S.of(context).success,
                message: 'edited successfully',
                contentType: ContentType.success,
              ),
            );
        } else if (state is UpdateAddressFailure) {
          Navigator.pop(context);
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
          onPressed: onPressed,
          child: state is UpdateAddressLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(
                  S.of(context).edit,
                  style: AppTextStyles.bold16(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
                ),
        );
      },
    );
  }
}
