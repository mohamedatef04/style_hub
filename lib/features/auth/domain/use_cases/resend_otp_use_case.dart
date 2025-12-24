import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class ResendOtpUseCase {
  final AuthRepo authRepo;
  ResendOtpUseCase({required this.authRepo});

  Future<Either<Failures, void>> call({required String email}) =>
      authRepo.resendOtp(email: email);
}
