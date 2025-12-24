import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/custom_app_bar.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_my_addresses_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_address_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_my_addresses_cubit/get_my_addresses_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/remove_address_cubit/remove_address_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/my_address_item_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class MyAddressesView extends StatelessWidget {
  const MyAddressesView({super.key});
  static const routeName = '/my-addresses';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: GetMyAddressesCubit(getIt.get<GetMyAddressesUseCase>())
            ..getMyAddresses(),
        ),
        BlocProvider(
          create: (context) =>
              RemoveAddressCubit(getIt.get<RemoveAddressUseCase>()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).myAddresses,
        ),
        body: BlocBuilder<GetMyAddressesCubit, GetMyAddressesState>(
          builder: (context, state) {
            if (state is GetMyAddressesSuccessState) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemCount: state.myAddresses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MyAddressItemWidget(
                      addressEntity: state.myAddresses[index],
                    ),
                  );
                },
              );
            } else if (state is GetMyAddressesErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is GetMyAddressesEmptyState) {
              return Center(
                child: Text(
                  S.of(context).emptyAddress,
                  style: AppTextStyles.bold20(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
