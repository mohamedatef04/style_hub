import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/domain/repos/home_repo.dart';

class GetProductsUseCase {
  final HomeRepo homeRepo;
  GetProductsUseCase({required this.homeRepo});

  Future<Either<Failures, List<CollectionItemEntity>>> call({
    required int page,
  }) async => homeRepo.getCollectionItems(
    page: page,
  );
}
