import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/features/home/domain/use_cases/get_offers_use_case.dart';
import 'package:style_hub/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:style_hub/features/home/presentation/cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:style_hub/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:style_hub/features/home/presentation/widgets/custom_drawer.dart';
import 'package:style_hub/features/home/presentation/widgets/header_shape_and_offers_list_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/header_text.dart';
import 'package:style_hub/features/home/presentation/widgets/collection_gridview.dart';
import 'package:style_hub/features/home/presentation/widgets/pagination_widget.dart';
import 'package:style_hub/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetOffersCubit(getIt.get<GetOffersUseCase>())..getOffers(),
        ),

        BlocProvider(
          create: (context) =>
              GetProductsCubit(getIt.get<GetProductsUseCase>())..getProducts(
                page: 1,
              ),
        ),
      ],
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: SizedBox(
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderShapeAndOffersListWidget(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10.h),
              ),
              SliverToBoxAdapter(
                child: HeaderText(title: S.of(context).newCollection),
              ),
              const CollectionGridview(),
              const SliverToBoxAdapter(
                child: PaginationWidget(totalPages: 5),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 100.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
