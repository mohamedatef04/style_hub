import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/root/presentation/cubits/nav_bar_cubit/nav_bar_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300, //New>(),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GNav(
        backgroundColor: Colors.transparent,
        tabMargin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),

        tabBorderRadius: 20.r,
        curve: Curves.easeIn, // tab animation curves
        duration: const Duration(milliseconds: 200), // tab animation duration
        gap: 2, // the tab button gap between icon and text
        color: const Color.fromARGB(255, 95, 93, 93), // unselected icon color
        activeColor: AppColors.whiteColor,
        tabBackgroundColor: AppColors.secondaryColor,
        tabBackgroundGradient: const LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
          ],
        ), // selected icon and text color
        iconSize: 20, // tab button icon size
        padding: EdgeInsets.all(10.w),
        onTabChange: (value) {
          context.read<NavBarCubit>().changeIndex(value);
        }, // navigation bar padding
        tabs: [
          const GButton(
            icon: CupertinoIcons.home,
          ),
          GButton(
            icon: Icons.circle,
            leading: Image.asset(
              Assets.imagesCategory,
              width: 20.w,
            ),
          ),
          const GButton(
            icon: CupertinoIcons.cart,
          ),
          const GButton(
            icon: CupertinoIcons.search,
          ),
        ],
      ),
    );
  }
}
