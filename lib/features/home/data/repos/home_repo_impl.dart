import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/data/data_source/home_data_source.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';
import 'package:style_hub/features/home/domain/entities/user_entity.dart';
import 'package:style_hub/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failures, List<OfferEntity>>> getOffers() async {
    try {
      final res = await homeDataSource.getOffers();
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CollectionItemEntity>>> getCollectionItems({
    required int page,
  }) async {
    try {
      final res = await homeDataSource.getCollectionItems(
        page: page,
      );
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getUsreInfo() async {
    try {
      final res = await homeDataSource.getUsreInfo();
      return Right(res.toEntity());
    } on ServerFailure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
