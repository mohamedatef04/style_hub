import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';
import 'package:style_hub/features/home/domain/entities/user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<OfferEntity>>> getOffers();
  Future<Either<Failures, List<CollectionItemEntity>>> getCollectionItems({
    required int page,
  });
  Future<Either<Failures, UserEntity>> getUsreInfo();
}
