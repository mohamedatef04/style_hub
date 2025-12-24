import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_category_products_use_case.dart';
import 'package:style_hub/features/categoreis/presentation/cubits/get_categories_products_cubit/get_category_products_cubit.dart';
import 'package:style_hub/features/categoreis/presentation/widgets/categories_list.dart';
import 'package:style_hub/features/categoreis/presentation/widgets/categories_products_grid_view.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_categories_use_case.dart';
import 'package:style_hub/features/categoreis/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(getIt.get<GetCategoriesUseCase>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              GetCategoryProductsCubit(getIt.get<GetCategoryProductsUseCase>())
                ..getCategoryProducts(category: 'gucci'),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).categoryNavBar,
            style: AppTextStyles.bold25(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const CustomScrollView(
          slivers: [
            CategoriesList(),
            CategoriesProductsGridView(),
          ],
        ),
      ),
    );
  }
}
