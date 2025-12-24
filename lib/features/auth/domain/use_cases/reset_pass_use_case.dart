import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class ResetPassUseCase {
  final AuthRepo authRepo;
  ResetPassUseCase({required this.authRepo});

  Future<Either<Failures, void>> call({
    required String email,
    required String otp,
    required String password,
  }) => authRepo.resetPassword(email: email, otp: otp, password: password);
}
