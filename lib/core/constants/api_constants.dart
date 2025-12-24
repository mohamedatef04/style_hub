import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String loginEndpoint = dotenv.env['LOGIN_ENDPOINT']!;
  static String registerEndpoint = dotenv.env['REGISTER_ENDPOINT']!;
  static String verifyEmailEndpoint = dotenv.env['VERIFY_EMAIL_ENDPOINT']!;
  static String forgotPasswordEndpoint =
      dotenv.env['FORGOT_PASSWORD_ENDPOINT']!;
  static String verifyOtpEndpoint = dotenv.env['VERIFY_OTP_ENDPOINT']!;
  static String resendOtpEndpoint = dotenv.env['RESEND_OTP_ENDPOINT']!;
  static String resetPasswordEndpoint = dotenv.env['RESET_PASSWORD_ENDPOINT']!;
  static String refreshTokenEndpoint = dotenv.env['REFRESH_TOKEN_ENDPOINT']!;
  static String logoutEndpoint = dotenv.env['LOGOUT_ENDPOINT']!;
  static String getOffersEndPoint = dotenv.env['GET_OFFERS_ENDPOINT']!;
  static String getCategoriesEndPoint = dotenv.env['GET_CATEGORIES_ENDPOINT']!;
  static String getProductsEndPoint = dotenv.env['GET_PRODUCTS_ENDPOINT']!;
  static String addToCartEndPoint = dotenv.env['ADD_TO_CART_ENDPOINT']!;
  static String getCartProductsEndPoint =
      dotenv.env['GET_CART_PRODUCTS_ENDPOINT']!;
  static String deleteCartItemEndPoint =
      dotenv.env['DELETE_CART_ITEM_ENDPOINT']!;
  static String updateCartItemByDecrementEndPoint =
      dotenv.env['UPDATE_CART_ITEM_DECREMENT_ENDPOINT']!;
  static String applyCouponEndPoint = dotenv.env['APPLY_COUPON_ENDPOINT']!;
  static String getUserInfoEndPoint = dotenv.env['GET_USER_INFO_ENDPOINT']!;
  static String addNewAddressEndPoint = dotenv.env['ADD_NEW_ADDRESS_ENDPOINT']!;
  static String getMyAddressesEndPoint =
      dotenv.env['GET_MY_ADDRESSES_ENDPOINT']!;
  static String removeAddressEndPoint = dotenv.env['REMOVE_ADDRESS_ENDPOINT']!;
  static String updateAddressEndPoint = dotenv.env['UPDATE_ADDRESS_ENDPOINT']!;
  static String googleLoginEndpoint = dotenv.env['GOOGLE_LOGIN_ENDPOINT']!;
}
