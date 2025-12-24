import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class GetCartItemsUseCase {
  final CartRepo cartRepo;
  GetCartItemsUseCase({required this.cartRepo});

  Future<Either<Failures, List<CartItemEntity>>> call() =>
      cartRepo.getCartItems();
}
