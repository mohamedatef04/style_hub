import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';
import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> register({
    required RegisterRequestEntity registerRequestEntity,
  });

  Future<Either<Failures, void>> verifyEmail({
    required String email,
    required String otp,
  });

  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failures, void>> sendEmailForResettingPassword({
    required String email,
  });

  Future<Either<Failures, void>> validateOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failures, void>> resetPassword({
    required String email,
    required String otp,
    required String password,
  });

  Future<Either<Failures, void>> resendOtp({required String email});

  Future<Either<Failures, void>> logout();

  Future<Either<Failures, LoginResponseEntity>> signInWithGoogle({
    required String idToken,
  });
}
