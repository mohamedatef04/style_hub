import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:style_hub/features/home/presentation/cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:style_hub/features/home/presentation/widgets/offer_skelton_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/offers_widget.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersSuccessState) {
          return ListView.builder(
            itemCount: state.offers.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: OffersWidget(
                  offerEntity: state.offers[index],
                ),
              );
            },
          );
        } else if (state is GetOffersErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                enableSwitchAnimation: true,
                ignoreContainers: false,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 10.w),
                  child: const OfferSkeltonWidget(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
