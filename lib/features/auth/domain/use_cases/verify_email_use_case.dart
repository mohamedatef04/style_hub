import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class VerifyEmailUseCase {
  final AuthRepo authRepo;
  VerifyEmailUseCase({required this.authRepo});

  Future<Either<Failures, void>> call({
    required String email,
    required String otp,
  }) => authRepo.verifyEmail(email: email, otp: otp);
}
