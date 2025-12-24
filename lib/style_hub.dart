import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/core/cubits/languege_toggel_cubit/languege_toggle_cubit.dart';
import 'package:style_hub/core/routes/app_routes.dart';
import 'package:style_hub/core/utils/app_colors.dart';
import 'package:style_hub/generated/l10n.dart';

class StyleHub extends StatelessWidget {
  const StyleHub({super.key, required this.initialLocal});
  final Locale initialLocal;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => LanguegeToggleCubit(initialLocal),
          child: BlocBuilder<LanguegeToggleCubit, Locale>(
            builder: (context, state) {
              return MaterialApp.router(
                useInheritedMediaQuery: true,
                builder: DevicePreview.appBuilder,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.whiteColor,
                  brightness: Brightness.light,
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: state,
              );
            },
          ),
        );
      },
    );
  }
}
