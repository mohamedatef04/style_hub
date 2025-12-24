import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class ValidateOtpUseCase {
  final AuthRepo authRepo;
  ValidateOtpUseCase({required this.authRepo});

  Future<Either<Failures, void>> call({
    required String email,
    required String otp,
  }) => authRepo.validateOtp(email: email, otp: otp);
}
