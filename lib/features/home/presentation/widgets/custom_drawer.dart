import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:style_hub/features/auth/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:style_hub/features/home/domain/use_cases/get_user_info_use_case.dart';
import 'package:style_hub/features/home/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:style_hub/features/home/presentation/widgets/drawer_list_tile.dart';
import 'package:style_hub/features/home/presentation/widgets/languege_toggle_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/logout_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetUserInfoCubit(getIt.get<GetUserInfoUseCase>())..getUserInfo(),
        ),
        BlocProvider(
          create: (context) =>
              LogoutCubit(logoutUseCase: getIt.get<LogoutUseCase>()),
        ),
      ],
      child: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.7,
        backgroundColor: AppColors.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.secondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: DrawerListTile(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                spacing: 10.h,
                children: [
                  LanguegeToggleWidget(),
                  SizedBox(height: 20.h),
                  LogoutWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
