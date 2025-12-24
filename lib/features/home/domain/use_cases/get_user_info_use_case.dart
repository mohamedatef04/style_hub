import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/user_entity.dart';
import 'package:style_hub/features/home/domain/repos/home_repo.dart';

class GetUserInfoUseCase {
  final HomeRepo homeRepo;
  GetUserInfoUseCase(this.homeRepo);
  Future<Either<Failures, UserEntity>> call() async => homeRepo.getUsreInfo();
}
