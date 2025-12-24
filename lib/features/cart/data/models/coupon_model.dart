import 'package:style_hub/features/cart/domain/entities/coupon_entity.dart';

class CouponModel {
  final String cartId;
  final double originalTotal;
  final double discountAmount;
  final double finalTotal;
  final String code;
  final String type;
  final double value;

  CouponModel({
    required this.cartId,
    required this.originalTotal,
    required this.discountAmount,
    required this.finalTotal,
    required this.code,
    required this.type,
    required this.value,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      cartId: json['cartId'],
      originalTotal: json['originalTotal'],
      discountAmount: json['discountAmount'],
      finalTotal: json['finalTotal'],
      code: json['coupon']['code'],
      type: json['coupon']['type'],
      value: json['coupon']['value'],
    );
  }
  CouponEntity toEntity() {
    return CouponEntity(
      originalTotal: originalTotal,
      discountAmount: discountAmount,
      finalTotal: finalTotal,
    );
  }
}
