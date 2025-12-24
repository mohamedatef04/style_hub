import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:style_hub/features/categoreis/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:style_hub/features/categoreis/presentation/cubits/get_categories_products_cubit/get_category_products_cubit.dart';
import 'package:style_hub/features/categoreis/presentation/widgets/category_index.dart';
import 'package:style_hub/features/categoreis/presentation/widgets/category_index_skelton.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 80.h,
              child: ListView.builder(
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CategoryIndex(
                      isSelected: index == currentIndex,
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        context
                            .read<GetCategoryProductsCubit>()
                            .getCategoryProducts(
                              category: state.categories[index].name ?? '',
                            );
                      },
                      categoryEntity: state.categories[index],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is GetCategoriesErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    enableSwitchAnimation: true,
                    ignoreContainers: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: const CategoryIndexSkelton(),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
