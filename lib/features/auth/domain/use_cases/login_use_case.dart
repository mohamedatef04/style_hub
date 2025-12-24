import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<Failures, LoginResponseEntity>> call({
    required String email,
    required String password,
  }) => authRepo.login(email: email, password: password);
}
