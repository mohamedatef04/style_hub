import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class AddToCartUseCase {
  final CartRepo cartRepo;
  AddToCartUseCase({required this.cartRepo});

  Future<Either<Failures, void>> call({
    required String productId,
    required int quantity,
  }) {
    return cartRepo.addToCart(productId: productId, quantity: quantity);
  }
}
