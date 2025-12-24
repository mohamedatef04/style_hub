part of 'apply_coupon_cubit.dart';

abstract class ApplyCouponState extends Equatable {
  const ApplyCouponState();

  @override
  List<Object> get props => [];
}

class ApplyCouponInitial extends ApplyCouponState {}

class ApplyCouponLoadingState extends ApplyCouponState {}

class ApplyCouponSuccessState extends ApplyCouponState {
  final CouponEntity couponEntity;
  const ApplyCouponSuccessState({required this.couponEntity});

  @override
  List<Object> get props => [couponEntity];
}

class ApplyCouponErrorState extends ApplyCouponState {
  final String errorMessage;
  const ApplyCouponErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
