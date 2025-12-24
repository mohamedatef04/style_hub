import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class RemoveAddressUseCase {
  final CartRepo cartRepo;
  RemoveAddressUseCase({required this.cartRepo});

  Future<Either<Failures, void>> call({required String addressId}) {
    return cartRepo.removeAddress(addressId: addressId);
  }
}
