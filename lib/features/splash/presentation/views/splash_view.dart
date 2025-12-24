import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/constants/constants.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:style_hub/features/root/presentation/views/root_view.dart';
import 'package:style_hub/generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      const storge = FlutterSecureStorage();
      final accessToken = await storge.read(
        key: Constants.accessToken,
      );
      if (accessToken != null && accessToken.isNotEmpty) {
        GoRouter.of(context).pushReplacement(RootView.routeName);
      } else {
        GoRouter.of(context).pushReplacement(OnBoardingView.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Stack(
                children: [
                  SvgPicture.asset(
                    Assets.imagesLogo1,
                    width: 100.w,
                  ),
                  SvgPicture.asset(Assets.imagesLogo2, width: 100.w),
                ],
              ),
              Text(
                S.of(context).splashLogo,
                style: AppTextStyles.bold30(context),
              ),
              const Spacer(),

              SvgPicture.asset(Assets.imagesLoading),
            ],
          ),
        ),
      ),
    );
  }
}
