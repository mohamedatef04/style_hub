import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/search/domain/repos/search_repo.dart';

class GetSearchItemsUseCase {
  final SearchRepo searchRepo;
  GetSearchItemsUseCase({required this.searchRepo});

  Future<Either<Failures, List<CollectionItemEntity>>> call({
    required String query,
  }) => searchRepo.searchProducts(query: query);
}
