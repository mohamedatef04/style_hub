import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/features/home/presentation/widgets/search_widget.dart';
import 'package:style_hub/features/search/domain/use_cases/get_search_items_use_case.dart';
import 'package:style_hub/features/search/presentation/cubits/get_search_items_cubit.dart';
import 'package:style_hub/features/search/presentation/widgets/search_grid_view.dart';
import 'package:style_hub/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSearchItemsCubit(getIt.get<GetSearchItemsUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).searchView,
            style: AppTextStyles.bold25(
              context,
            ).copyWith(color: AppColors.blackColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        return SearchWidget(
                          onChanged: (value) {
                            context.read<GetSearchItemsCubit>().getSearchItems(
                              query: value,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SearchGridView(),
          ],
        ),
      ),
    );
  }
}
