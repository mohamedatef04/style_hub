import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class UpdateAddressUseCase {
  final CartRepo cartRepo;
  UpdateAddressUseCase({required this.cartRepo});

  Future<Either<Failures, void>> call({
    required AddressEntity addressEntity,
  }) async {
    return await cartRepo.updateAddress(addressEntity: addressEntity);
  }
}
