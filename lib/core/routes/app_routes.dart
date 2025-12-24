import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/features/auth/data/models/reset_pass_args.dart';
import 'package:style_hub/features/auth/domain/use_cases/login_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/register_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/reset_pass_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/send_email_for_reset_pass_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/validate_otp_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/verify_email_use_case.dart';
import 'package:style_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/reset_pass_cubit/reset_password_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/send_email_for_reset_pass_cubit/send_email_for_resetting_password_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/validate_otp_cubit/validate_otp_cubit.dart';
import 'package:style_hub/features/auth/presentation/cubits/verify_email_cubit/verify_email_cubit.dart';
import 'package:style_hub/features/auth/presentation/views/reset_password_view.dart';
import 'package:style_hub/features/auth/presentation/views/validate_otp_view.dart';
import 'package:style_hub/features/auth/presentation/views/forget_password_view.dart';
import 'package:style_hub/features/auth/presentation/views/register_view.dart';
import 'package:style_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:style_hub/features/auth/presentation/views/verify_email_after_register_view.dart';
import 'package:style_hub/features/cart/presentation/views/checkout_view.dart';
import 'package:style_hub/features/cart/presentation/views/my_addresses_view.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/presentation/views/home_view.dart';
import 'package:style_hub/features/home/presentation/views/item_details_view.dart';
import 'package:style_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:style_hub/features/root/presentation/views/root_view.dart';
import 'package:style_hub/features/splash/presentation/views/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: OnBoardingView.routeName,
      builder: (context, state) => const OnBoardingView(),
    ),

    GoRoute(
      path: SignInView.routeName,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: RegisterView.routeName,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(getIt.get<RegisterUseCase>()),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: VerifyEmailAfterRegisterView.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                VerifyEmailCubit(getIt.get<VerifyEmailUseCase>()),
          ),
          BlocProvider(
            create: (context) => ResendOtpCubit(getIt.get<ResendOtpUseCase>()),
          ),
        ],
        child: VerifyEmailAfterRegisterView(email: state.extra as String),
      ),
    ),
    GoRoute(
      path: ForgetPasswordView.routeName,
      builder: (context, state) => BlocProvider(
        create: (context) => SendEmailForResettingPasswordCubit(
          getIt.get<SendEmailForResetPassUseCase>(),
        ),
        child: const ForgetPasswordView(),
      ),
    ),
    GoRoute(
      path: ValidateOtpView.routeName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ValidateOtpCubit(getIt.get<ValidateOtpUseCase>()),
          ),
          BlocProvider(
            create: (context) => ResendOtpCubit(getIt.get<ResendOtpUseCase>()),
          ),
        ],
        child: ValidateOtpView(
          email: state.extra as String,
        ),
      ),
    ),
    GoRoute(
      path: ResetPasswordView.routeName,
      builder: (context, state) => BlocProvider(
        create: (context) => ResetPasswordCubit(getIt.get<ResetPassUseCase>()),
        child: ResetPasswordView(
          resetPassArgs: state.extra as ResetPassArgs,
        ),
      ),
    ),
    GoRoute(
      path: RootView.routeName,
      builder: (context, state) => const RootView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: ItemDetailsView.routeName,
      builder: (context, state) => ItemDetailsView(
        collectionItemEntity: state.extra as CollectionItemEntity,
      ),
    ),

    GoRoute(
      path: CheckoutView.routeName,
      builder: (context, state) => const CheckoutView(),
    ),
    GoRoute(
      path: MyAddressesView.routeName,
      builder: (context, state) => const MyAddressesView(),
    ),

    // GoRoute(
    //   path: HomeView.routeName,
    //   builder: (context, state) => const HomeView(),
    // ),
    // GoRoute(
    //   path: ItemDetailsView.routeName,
    //   builder: (context, state) => ItemDetailsView(
    //     menuItemEntity: state.extra as MenuItemEntity,
    //   ),
    // ),
    // GoRoute(
    //   path: CartView.routeName,
    //   builder: (context, state) => const CartView(),
    // ),
  ],
);
