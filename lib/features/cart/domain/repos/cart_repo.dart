import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/domain/entities/coupon_entity.dart';

abstract class CartRepo {
  Future<Either<Failures, void>> addToCart({
    required String productId,
    required int quantity,
  });
  Future<Either<Failures, List<CartItemEntity>>> getCartItems();
  Future<Either<Failures, void>> removeCartItem({
    required String productId,
    required String itemId,
  });
  Future<Either<Failures, void>> updateCartItemByDecrement({
    required String productId,
  });
  Future<Either<Failures, CouponEntity>> applyCoupon({
    required String couponCode,
  });
  Future<Either<Failures, void>> addNewAddress({
    required AddressEntity addressEntity,
  });
  Future<Either<Failures, List<AddressEntity>>> getMyAddresses();
  Future<Either<Failures, void>> removeAddress({
    required String addressId,
  });
  Future<Either<Failures, void>> updateAddress({
    required AddressEntity addressEntity,
  });
}
