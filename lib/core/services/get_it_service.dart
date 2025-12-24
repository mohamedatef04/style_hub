import 'package:get_it/get_it.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/core/services/google_auth_service.dart';
import 'package:style_hub/features/auth/data/data_source/auth_data_source.dart';
import 'package:style_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';
import 'package:style_hub/features/auth/domain/use_cases/login_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/register_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/reset_pass_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/send_email_for_reset_pass_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/validate_otp_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/verify_email_use_case.dart';
import 'package:style_hub/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:style_hub/features/cart/data/data_source/cart_data_source.dart';
import 'package:style_hub/features/cart/data/repos/cart_repo_impl.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_new_address_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/apply_coupon_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_cart_items_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_my_addresses_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_address_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_cart_item_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_address_use_case.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_cart_item_by_decrement_use_case.dart';
import 'package:style_hub/features/categoreis/data/data_source/categories_data_source.dart';
import 'package:style_hub/features/categoreis/data/repos/categories_repo_impl.dart';
import 'package:style_hub/features/categoreis/domain/repos/categories_repo.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_category_products_use_case.dart';
import 'package:style_hub/features/home/data/data_source/home_data_source.dart';
import 'package:style_hub/features/home/data/repos/home_repo_impl.dart';
import 'package:style_hub/features/home/domain/repos/home_repo.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_categories_use_case.dart';
import 'package:style_hub/features/home/domain/use_cases/get_offers_use_case.dart';
import 'package:style_hub/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:style_hub/features/home/domain/use_cases/get_user_info_use_case.dart';
import 'package:style_hub/features/search/data/data_source/search_data_source.dart';
import 'package:style_hub/features/search/data/repos/search_repo_impl.dart';
import 'package:style_hub/features/search/domain/repos/search_repo.dart';
import 'package:style_hub/features/search/domain/use_cases/get_search_items_use_case.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //* auth
  getIt.registerLazySingleton<AuthDataSource>(
    () {
      final apiService = getIt<ApiService>();
      return AuthDataSourceImpl(apiService: apiService);
    },
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt.get<AuthDataSource>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () {
      final authRepo = getIt<AuthRepo>();
      return RegisterUseCase(authRepo: authRepo);
    },
  );
  getIt.registerLazySingleton<VerifyEmailUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return VerifyEmailUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<LoginUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return LoginUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<SendEmailForResetPassUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return SendEmailForResetPassUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<ValidateOtpUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return ValidateOtpUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<ResetPassUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return ResetPassUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<ResendOtpUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return ResendOtpUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<LogoutUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return LogoutUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<GoogleSignInUseCase>(() {
    final authRepo = getIt<AuthRepo>();
    return GoogleSignInUseCase(authRepo: authRepo);
  });
  getIt.registerLazySingleton<GoogleAuthService>(() {
    return GoogleAuthService();
  });

  // //* home
  getIt.registerLazySingleton<HomeDataSource>(() {
    return HomeDataSourceImpl(apiService: getIt.get<ApiService>());
  });
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeDataSource: getIt.get<HomeDataSource>()),
  );
  getIt.registerLazySingleton<GetOffersUseCase>(() {
    return GetOffersUseCase(getIt.get<HomeRepo>());
  });

  getIt.registerLazySingleton<GetProductsUseCase>(() {
    return GetProductsUseCase(homeRepo: getIt.get<HomeRepo>());
  });
  getIt.registerLazySingleton<GetUserInfoUseCase>(() {
    return GetUserInfoUseCase(getIt.get<HomeRepo>());
  });

  //* categories
  getIt.registerLazySingleton<CategoriesDataSource>(() {
    final apiService = getIt<ApiService>();
    return CategoriesDataSourceImpl(apiService: apiService);
  });
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      categoriesDataSource: getIt.get<CategoriesDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () {
      return GetCategoriesUseCase(categoriesRepo: getIt.get<CategoriesRepo>());
    },
  );
  getIt.registerLazySingleton<GetCategoryProductsUseCase>(
    () {
      return GetCategoryProductsUseCase(getIt.get<CategoriesRepo>());
    },
  );

  //* cart
  getIt.registerLazySingleton<CartDataSource>(() {
    final apiService = getIt<ApiService>();
    return CartDataSourceImpl(apiService: apiService);
  });
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartDataSource: getIt.get<CartDataSource>()),
  );
  getIt.registerLazySingleton<AddToCartUseCase>(
    () {
      return AddToCartUseCase(cartRepo: getIt.get<CartRepo>());
    },
  );
  getIt.registerLazySingleton<GetCartItemsUseCase>(() {
    return GetCartItemsUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<RemoveCartItemUseCase>(() {
    return RemoveCartItemUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<UpdateCartItemByDecrementUseCase>(() {
    return UpdateCartItemByDecrementUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<ApplyCouponUseCase>(() {
    return ApplyCouponUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<AddNewAddressUseCase>(() {
    return AddNewAddressUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<GetMyAddressesUseCase>(() {
    return GetMyAddressesUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<RemoveAddressUseCase>(() {
    return RemoveAddressUseCase(cartRepo: getIt.get<CartRepo>());
  });
  getIt.registerLazySingleton<UpdateAddressUseCase>(() {
    return UpdateAddressUseCase(cartRepo: getIt.get<CartRepo>());
  });

  //* search
  getIt.registerLazySingleton<SearchDataSource>(() {
    final apiService = getIt<ApiService>();
    return SearchDataSourceImpl(apiService: apiService);
  });
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(searchDataSource: getIt.get<SearchDataSource>()),
  );
  getIt.registerLazySingleton<GetSearchItemsUseCase>(
    () {
      return GetSearchItemsUseCase(searchRepo: getIt.get<SearchRepo>());
    },
  );

  // getIt.registerLazySingleton<HomeDataSource>(
  //   () {
  //     final apiService = getIt<ApiService>();
  //     return HomeDataSourceImpl(apiService: apiService);
  //   },
  // );
  // getIt.registerLazySingleton<HomeRepo>(
  //   () => HomeRepoImpl(homeDataSource: getIt.get<HomeDataSource>()),
  // );
  // getIt.registerLazySingleton<GetMenuItemsUseCase>(
  //   () {
  //     return GetMenuItemsUseCase(homeRepo: getIt.get<HomeRepo>());
  //   },
  // );

  // getIt.registerLazySingleton<GetToppingsUseCase>(
  //   () {
  //     return GetToppingsUseCase(getIt.get<HomeRepo>());
  //   },
  // );
  // getIt.registerLazySingleton<GetSideOptionsUseCase>(
  //   () {
  //     return GetSideOptionsUseCase(getIt.get<HomeRepo>());
  //   },
  // );
  // //* cart
  // getIt.registerLazySingleton<CartDataSource>(
  //   () => CartDataSourceImpl(apiService: getIt.get<ApiService>()),
  // );
  // getIt.registerLazySingleton<CartRepo>(
  //   () => CartRepoImpl(cartDataSource: getIt.get<CartDataSource>()),
  // );
  // getIt.registerLazySingleton<AddToCartUseCase>(
  //   () {
  //     return AddToCartUseCase(cartRepo: getIt.get<CartRepo>());
  //   },
  // );
}
