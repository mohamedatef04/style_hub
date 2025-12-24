import 'package:flutter/material.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/generated/l10n.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;
    final double scaleFactor = screenWidth / baseWidth;

    return SafeArea(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: AppColors.whiteColor,
            size: 24 * scaleFactor,
          ),
        ),
        title: Text(
          S.of(context).homeWelcomeMessage,
          style: AppTextStyles.bold20(context).copyWith(
            fontSize: 20 * scaleFactor,
          ),
        ),
        trailing: Container(
          height: 40 * scaleFactor,
          width: 40 * scaleFactor,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(image: AssetImage(Assets.imagesAvatar)),
          ),
        ),
      ),
    );
  }
}
