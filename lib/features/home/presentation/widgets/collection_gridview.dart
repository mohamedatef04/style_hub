import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:style_hub/core/utils/grid_utils.dart';
import 'package:style_hub/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:style_hub/features/home/presentation/widgets/collection_item.dart';
import 'package:style_hub/features/home/presentation/widgets/collection_item_skelton.dart';

class CollectionGridview extends StatefulWidget {
  const CollectionGridview({super.key});

  @override
  State<CollectionGridview> createState() => _MenuGridviewState();
}

class _MenuGridviewState extends State<CollectionGridview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccessState) {
          return SliverPadding(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
              top: 10.h,
              bottom: 10.h,
            ),
            sliver: SliverGrid.builder(
              itemCount: state.collectionItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 5.w,
                crossAxisCount: GridUtils.calculateCrossAxisCount(context),
                childAspectRatio: GridUtils.calculateProductGridAspectRatio(
                  context,
                ),
              ),
              itemBuilder: (context, index) {
                return CollectionItem(
                  collectionItemEntity: state.collectionItems[index],
                );
              },
            ),
          );
        } else if (state is GetProductsErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
              top: 10.h,
              bottom: 100.h,
            ),
            sliver: SliverGrid.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 5.w,
                crossAxisCount: GridUtils.calculateCrossAxisCount(context),
                childAspectRatio: GridUtils.calculateProductGridAspectRatio(
                  context,
                ),
              ),
              itemBuilder: (context, index) {
                return const Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  ignoreContainers: false,
                  child: CollectionItemSkelton(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
