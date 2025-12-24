import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<CollectionItemEntity>>> searchProducts({
    required String query,
  });
}
