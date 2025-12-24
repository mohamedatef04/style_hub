import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/widgets/custom_app_bar.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_new_address_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_my_addresses_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_new_address_cubit/add_new_address_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_my_addresses_cubit/get_my_addresses_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/add_new_address_widget.dart';
import 'package:style_hub/features/cart/presentation/widgets/delivery_methods_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddNewAddressCubit(getIt.get<AddNewAddressUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              GetMyAddressesCubit(getIt.get<GetMyAddressesUseCase>())
                ..getMyAddresses(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).checkoutBar,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              spacing: 20.h,
              children: const [
                DeliveryMethodsWidget(),
                AddNewAddressWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
