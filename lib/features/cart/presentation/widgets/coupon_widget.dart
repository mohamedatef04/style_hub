import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:style_hub/features/cart/presentation/cubits/apply_coupon_cubit/apply_coupon_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({super.key});

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  TextEditingController textEditingController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: CustomTextFormField(
        controller: textEditingController,
        label: S.of(context).coupon,
        hintText: S.of(context).couponHint,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).couponValidation;
          }
          return null;
        },
        suffixIcon: Container(
          width: 70.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                context.read<ApplyCouponCubit>().applyCoupon(
                  couponCode: textEditingController.text.trim(),
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: BlocConsumer<ApplyCouponCubit, ApplyCouponState>(
              listener: (context, state) {
                if (state is ApplyCouponSuccessState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      showSnackBar(
                        title: S.of(context).success,
                        message: S.of(context).couponApplied,
                        contentType: ContentType.success,
                      ),
                    );
                } else if (state is ApplyCouponErrorState) {
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
                return Center(
                  child: state is ApplyCouponLoadingState
                      ? const CircularProgressIndicator(
                          color: AppColors.whiteColor,
                        )
                      : Text(
                          S.of(context).apply,
                          style: AppTextStyles.bold16(context),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
