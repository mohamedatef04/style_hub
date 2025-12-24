import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/data/data_source/auth_data_source.dart';
import 'package:style_hub/features/auth/data/models/register_request_model.dart';
import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';
import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<Failures, void>> register({
    required RegisterRequestEntity registerRequestEntity,
  }) async {
    try {
      final model = RegisterRequestModel.fromEntity(registerRequestEntity);
      await authDataSource.register(
        registerRequestModel: model,
      );
      return const Right(null);
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      await authDataSource.verifyEmail(email: email, otp: otp);
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authDataSource.login(email: email, password: password);
      return Right(res.toEntity());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> sendEmailForResettingPassword({
    required String email,
  }) async {
    try {
      await authDataSource.sendEmailForResettingPassword(email: email);
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> validateOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await authDataSource.validateOtp(email: email, otp: otp);
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    try {
      await authDataSource.resetPassword(
        email: email,
        otp: otp,
        password: password,
      );
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> resendOtp({required String email}) async {
    try {
      await authDataSource.resendOtp(email: email);
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> logout() async {
    try {
      await authDataSource.logout();
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> signInWithGoogle({
    required String idToken,
  }) async {
    try {
      final res = await authDataSource.signInWithGoogle(idToken: idToken);
      return Right(res.toEntity());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
