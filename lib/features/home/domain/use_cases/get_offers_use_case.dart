import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';
import 'package:style_hub/features/home/domain/repos/home_repo.dart';

class GetOffersUseCase {
  final HomeRepo homeRepo;
  GetOffersUseCase(this.homeRepo);
  Future<Either<Failures, List<OfferEntity>>> call() async =>
      homeRepo.getOffers();
}
