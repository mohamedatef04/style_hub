import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/categoreis/domain/repos/categories_repo.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

class GetCategoryProductsUseCase {
  final CategoriesRepo categoriesRepo;

  GetCategoryProductsUseCase(this.categoriesRepo);

  Future<Either<Failures, List<CollectionItemEntity>>> call({
    required String category,
  }) async => categoriesRepo.getCategoryProducts(category: category);
}
