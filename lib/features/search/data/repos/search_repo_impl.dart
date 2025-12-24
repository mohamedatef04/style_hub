import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/search/data/data_source/search_data_source.dart';
import 'package:style_hub/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});
  @override
  Future<Either<Failures, List<CollectionItemEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      final res = await searchDataSource.searchProducts(query: query);
      return Right(res.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is ServerFailure) {
        return Left(e);
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
