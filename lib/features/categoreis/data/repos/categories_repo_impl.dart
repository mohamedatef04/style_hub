import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/categoreis/data/data_source/categories_data_source.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';
import 'package:style_hub/features/categoreis/domain/repos/categories_repo.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesDataSource categoriesDataSource;

  CategoriesRepoImpl({required this.categoriesDataSource});
  @override
  Future<Either<Failures, List<CategoryEntity>>> getCategories() async {
    try {
      final res = await categoriesDataSource.getCategories();
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CollectionItemEntity>>> getCategoryProducts({
    required String category,
  }) async {
    try {
      final res = await categoriesDataSource.getCategoryProducts(
        category: category,
      );
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
