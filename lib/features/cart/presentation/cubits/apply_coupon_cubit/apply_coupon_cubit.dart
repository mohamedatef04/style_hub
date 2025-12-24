import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/entities/coupon_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/apply_coupon_use_case.dart';
part 'apply_coupon_state.dart';

class ApplyCouponCubit extends Cubit<ApplyCouponState> {
  ApplyCouponCubit(this.applyCouponUseCase) : super(ApplyCouponInitial());
  final ApplyCouponUseCase applyCouponUseCase;

  Future<void> applyCoupon({required String couponCode}) async {
    emit(ApplyCouponLoadingState());
    final result = await applyCouponUseCase.call(couponCode: couponCode);
    result.fold(
      (l) => emit(ApplyCouponErrorState(errorMessage: l.errorMessage)),
      (r) => emit(ApplyCouponSuccessState(couponEntity: r)),
    );
  }
}
