import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_add_to_cart_button_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_header_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/item_details_tralling_widget.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.collectionItemEntity});
  final CollectionItemEntity collectionItemEntity;
  static const routeName = '/item-details';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(getIt.get<AddToCartUseCase>()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ItemDetailsHeaderWidget(collectionItemEntity: collectionItemEntity),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: ItemDetailsTrallingWidget(
                  collectionItemEntity: collectionItemEntity,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ItemDetailsAddToCartButtonWidget(
          collectionItemEntity: collectionItemEntity,
        ),
      ),
    );
  }
}
