import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';
import 'package:style_hub/features/categoreis/domain/repos/categories_repo.dart';

class GetCategoriesUseCase {
  final CategoriesRepo categoriesRepo;
  GetCategoriesUseCase({required this.categoriesRepo});

  Future<Either<Failures, List<CategoryEntity>>> call() async =>
      categoriesRepo.getCategories();
}
