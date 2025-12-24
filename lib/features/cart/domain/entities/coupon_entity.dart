class CouponEntity {
  final double originalTotal;
  final double discountAmount;
  final double finalTotal;

  const CouponEntity({
    required this.originalTotal,
    required this.discountAmount,
    required this.finalTotal,
  });
}
