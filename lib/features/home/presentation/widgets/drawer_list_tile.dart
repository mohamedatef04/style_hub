import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/home/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({super.key});

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  String? userName;
  String? userEmail;
  String? userImage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
      builder: (context, state) {
        if (state is GetUserInfoSuccessState) {
          userName = state.userEntity.name;
          userEmail = state.userEntity.email;
          userImage = state.userEntity.image;
        }
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 60.h,
            width: 60.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: (userImage != null && userImage!.isNotEmpty)
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userImage!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.imagesAvatar),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  )
                : Image.asset(Assets.imagesAvatar),
          ),
          title: Text(
            userName ?? '',
            style: AppTextStyles.bold16(
              context,
            ).copyWith(color: AppColors.blackColor),
          ),
          subtitle: Text(
            userEmail ?? '',
            style: AppTextStyles.regular12(
              context,
            ).copyWith(color: AppColors.blackColor),
          ),
        );
      },
    );
  }
}
