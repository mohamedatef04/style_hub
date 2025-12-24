import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class RemoveCartItemUseCase {
  final CartRepo cartRepo;
  RemoveCartItemUseCase({required this.cartRepo});

  Future<Either<Failures, void>> call({
    required String productId,
    required String itemId,
  }) {
    return cartRepo.removeCartItem(productId: productId, itemId: itemId);
  }
}
