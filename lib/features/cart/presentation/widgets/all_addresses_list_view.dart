import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_my_addresses_cubit/get_my_addresses_cubit.dart';
import 'package:style_hub/features/cart/presentation/widgets/address_item.dart';
import 'package:style_hub/generated/l10n.dart';

class AllAddressesList extends StatefulWidget {
  const AllAddressesList({super.key});

  @override
  State<AllAddressesList> createState() => _AllAddressesListState();
}

class _AllAddressesListState extends State<AllAddressesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyAddressesCubit, GetMyAddressesState>(
      builder: (context, state) {
        if (state is GetMyAddressesSuccessState) {
          return SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: state.myAddresses.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: AddressItem(
                    addressEntity: state.myAddresses[index],
                    isSelected: index == currentIndex,
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is GetMyAddressesEmptyState) {
          return Text(
            S.of(context).emptyAddress,
            style: AppTextStyles.semiBold16(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is GetMyAddressesErrorState) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
