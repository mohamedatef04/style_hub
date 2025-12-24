import 'package:dio/dio.dart';
import 'package:style_hub/core/constants/api_constants.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/core/services/api_service.dart';
import 'package:style_hub/features/auth/data/models/login_response_model.dart';
import 'package:style_hub/features/auth/data/models/register_request_model.dart';

abstract class AuthDataSource {
  Future<void> register({required RegisterRequestModel registerRequestModel});
  Future<void> verifyEmail({required String email, required String otp});
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });
  Future<void> sendEmailForResettingPassword({required String email});
  Future<void> validateOtp({required String email, required String otp});
  Future<void> resetPassword({
    required String email,
    required String otp,
    required String password,
  });
  Future<void> resendOtp({required String email});
  Future<void> logout();
  Future<LoginResponseModel> signInWithGoogle({required String idToken});
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService apiService;

  AuthDataSourceImpl({required this.apiService});
  @override
  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.registerEndpoint,
        data: registerRequestModel.toJson(),
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> verifyEmail({required String email, required String otp}) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.verifyEmailEndpoint,
        data: {
          'email': email,
          'otp': otp,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await apiService.postRequest(
        endpoint: ApiConstants.loginEndpoint,
        data: {'email': email, 'password': password},
      );
      final jsonData = res.data;
      return LoginResponseModel.fromJson(jsonData);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> sendEmailForResettingPassword({required String email}) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.forgotPasswordEndpoint,
        data: {'email': email},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> validateOtp({required String email, required String otp}) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.verifyOtpEndpoint,
        data: {'email': email, 'otp': otp},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.resetPasswordEndpoint,
        data: {'email': email, 'otp': otp, 'newPassword': password},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> resendOtp({required String email}) async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.resendOtpEndpoint,
        data: {'email': email},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiService.postRequest(
        endpoint: ApiConstants.logoutEndpoint,
        data: {},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<LoginResponseModel> signInWithGoogle({required String idToken}) async {
    try {
      final res = await apiService.postRequest(
        endpoint: ApiConstants.googleLoginEndpoint,
        data: {'idToken': idToken},
      );

      final jsonData = res.data;
      return LoginResponseModel.fromJson(jsonData);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
