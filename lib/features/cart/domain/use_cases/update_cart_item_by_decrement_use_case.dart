import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class UpdateCartItemByDecrementUseCase {
  final CartRepo cartRepo;

  UpdateCartItemByDecrementUseCase({required this.cartRepo});

  Future<Either<Failures, void>> call({required String productId}) {
    return cartRepo.updateCartItemByDecrement(productId: productId);
  }
}
