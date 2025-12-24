import 'package:dartz/dartz.dart';
import 'package:style_hub/core/errors/failures.dart';
import 'package:style_hub/features/cart/domain/entities/coupon_entity.dart';
import 'package:style_hub/features/cart/domain/repos/cart_repo.dart';

class ApplyCouponUseCase {
  final CartRepo cartRepo;
  ApplyCouponUseCase({required this.cartRepo});

  Future<Either<Failures, CouponEntity>> call({required String couponCode}) {
    return cartRepo.applyCoupon(couponCode: couponCode);
  }
}
