import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/custom_text_botton.dart';
import 'package:style_hub/generated/l10n.dart';

void showItemDetailsBottomSheet(
  BuildContext parentContext, {
  required String image,
  required String title,
  required String price,
  required void Function()? onTap,
  required void Function()? addToCart,
}) {
  showModalBottomSheet(
    context: parentContext,
    isScrollControlled: true,
    builder: (context) {
      return BlocProvider.value(
        value: parentContext.read<AddToCartCubit>(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 200.h,
                        width: 200.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: AppTextStyles.semiBold16(context),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        S.of(context).detailsView,
                        style: AppTextStyles.semiBold16(context).copyWith(
                          color: AppColors.orangeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      '\$ $price',
                      style: AppTextStyles.bold20(
                        context,
                      ).copyWith(color: AppColors.orangeColor),
                    ),
                    const Spacer(),
                    BlocConsumer<AddToCartCubit, AddToCartState>(
                      listener: (context, state) {
                        if (state is AddToCartSuccessState) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(parentContext)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              showSnackBar(
                                title: S.of(parentContext).success,
                                message: S.of(parentContext).addedToCartSuccess,
                                contentType: ContentType.success,
                              ),
                            );
                        } else if (state is AddToCartErrorState) {
                          ScaffoldMessenger.of(parentContext)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              showSnackBar(
                                title: S.of(parentContext).error,
                                message: state.errorMessage,
                                contentType: ContentType.failure,
                              ),
                            );
                        }
                      },
                      builder: (context, state) {
                        return CustomTextBotton(
                          onPressed: addToCart,
                          child: state is AddToCartLoadingState
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  ' ${S.of(context).addToCart}',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bold16(context),
                                ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 10.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
