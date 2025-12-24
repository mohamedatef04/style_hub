import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/data/data_source/cart_data_source.dart';
import 'package:style_hub/features/cart/data/models/address_model.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/domain/entities/coupon_entity.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSource cartDataSource;

  CartRepoImpl({required this.cartDataSource});
  @override
  Future<Either<Failures, void>> addToCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      final res = await cartDataSource.addToCart(
        productId: productId,
        quantity: quantity,
      );
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CartItemEntity>>> getCartItems() async {
    try {
      final res = await cartDataSource.getCartItems();
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> removeCartItem({
    required String productId,
    required String itemId,
  }) async {
    try {
      final res = await cartDataSource.removeCartItem(
        productId: productId,
        itemId: itemId,
      );
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateCartItemByDecrement({
    required String productId,
  }) async {
    try {
      final res = await cartDataSource.updateCartItemByDecrement(
        productId: productId,
      );
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CouponEntity>> applyCoupon({
    required String couponCode,
  }) async {
    try {
      final res = await cartDataSource.applyCoupon(couponCode: couponCode);
      return Right(res.toEntity());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> addNewAddress({
    required AddressEntity addressEntity,
  }) async {
    try {
      final model = AddressModel.fromEntity(addressEntity);
      final res = await cartDataSource.addNewAddress(
        addressModel: model,
      );
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<AddressEntity>>> getMyAddresses() async {
    try {
      final res = await cartDataSource.getMyAddresses();
      return Right(res.map((e) => e.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> removeAddress({
    required String addressId,
  }) async {
    try {
      final res = await cartDataSource.removeAddress(addressId: addressId);
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateAddress({
    required AddressEntity addressEntity,
  }) async {
    try {
      final model = AddressModel.fromEntity(addressEntity);
      final res = await cartDataSource.updateAddress(
        addressModel: model,
      );
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
