import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/widgets/custom_nav_bar.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:style_hub/features/cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style_hub/features/cart/presentation/views/cart_view.dart';
import 'package:style_hub/features/categoreis/presentation/views/categories_view.dart';
import 'package:style_hub/features/home/presentation/views/home_view.dart';
import 'package:style_hub/features/root/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:style_hub/features/search/presentation/views/search_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});
  static const routeName = '/root';

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final List<Widget> _screens = [
    const HomeView(),
    const CategoriesView(),
    const CartView(),
    const SearchView(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(getIt.get<AddToCartUseCase>()),
        ),
      ],
      child: BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, state) {
          if (state is NavBarIndexChanged) {}
        },
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: _screens[context.read<NavBarCubit>().currentIndex],
            bottomNavigationBar: const CustomNavBar(),
          );
        },
      ),
    );
  }
}
