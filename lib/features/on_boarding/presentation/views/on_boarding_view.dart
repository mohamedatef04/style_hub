import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/utils/assets.dart';
import 'package:style_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:style_hub/features/on_boarding/models/on_boarding_item_model.dart';
import 'package:style_hub/features/on_boarding/presentation/widgets/on_boarding_item.dart';
import 'package:style_hub/generated/l10n.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const routeName = '/onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);
  List<OnBoardingItemModel> get onBoardingItems => [
    OnBoardingItemModel(
      image: Assets.imagesOnBoardingOne,
      title: S.of(context).onBoardingTitle1,
      description: S.of(context).onBoardingSubtitle1,
      buttonText: S.of(context).next,
    ),
    OnBoardingItemModel(
      image: Assets.imagesOnBoardingTwo,
      title: S.of(context).onBoardingTitle2,
      description: S.of(context).onBoardingSubtitle2,
      buttonText: S.of(context).getStarted,
    ),
  ];
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: onBoardingItems
            .map(
              (e) => OnBoardingItem(
                pageController: pageController,
                onBoardingItemModel: e,
                onPressed: () async {
                  if (pageController.page == 0) {
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else {
                    GoRouter.of(
                      context,
                    ).pushReplacement(SignInView.routeName);
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
