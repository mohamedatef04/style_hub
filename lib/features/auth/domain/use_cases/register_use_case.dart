import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';
import 'package:style_hub/features/auth/domain/repos/auth_repo_.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  Future<Either<Failures, void>> call({
    required RegisterRequestEntity registerRequestEntity,
  }) => authRepo.register(registerRequestEntity: registerRequestEntity);
}
