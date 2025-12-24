import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failures, List<CategoryEntity>>> getCategories();
  Future<Either<Failures, List<CollectionItemEntity>>> getCategoryProducts({
    required String category,
  });
}
