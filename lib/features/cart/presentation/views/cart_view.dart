import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/domain/use_cases/apply_coupon_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_cart_items_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_cart_item_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_cart_item_by_decrement_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/apply_coupon_cubit/apply_coupon_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/decrement_cart_item_quantity_cubit/decrement_cart_item_quantity_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_cart_products_cubit/get_cart_items_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/remove_cart_item_cubit/remove_cart_item_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/app_bar_cart_widegt.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_items_details_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:style_hub/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCartItemsCubit(getIt.get<GetCartItemsUseCase>())
                ..getCartItems(),
        ),
        BlocProvider(
          create: (context) =>
              RemoveCartItemCubit(getIt.get<RemoveCartItemUseCase>()),
        ),
        BlocProvider(
          create: (context) => DecrementCartItemQuantityCubit(
            getIt.get<UpdateCartItemByDecrementUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              ApplyCouponCubit(getIt.get<ApplyCouponUseCase>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            S.of(context).myCart,
            style: AppTextStyles.bold25(context),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const AppBarCartWidegt(),
            ),
          ],
        ),
        body: BlocListener<RemoveCartItemCubit, RemoveCartItemState>(
          listener: (context, state) {
            if (state is RemoveCartItemSuccessState) {
              context.read<GetCartItemsCubit>().getCartItems();
            } else if (state is RemoveCartItemErrorState) {
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
          child: Column(
            children: [
              const Expanded(child: CartItemsList()),
              BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
                builder: (context, state) {
                  if (state is GetCartItemsSuccessState &&
                      state.cartItems.isNotEmpty) {
                    return const CartItemsDetailsWidget();
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
