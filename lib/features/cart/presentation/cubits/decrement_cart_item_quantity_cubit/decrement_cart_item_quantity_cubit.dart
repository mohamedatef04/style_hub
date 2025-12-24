import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_cart_item_by_decrement_use_case.dart';
part 'decrement_cart_item_quantity_state.dart';

class DecrementCartItemQuantityCubit
    extends Cubit<DecrementCartItemQuantityState> {
  DecrementCartItemQuantityCubit(this.updateCartItemByDecrementUseCase)
    : super(DecrementCartItemQuantityInitial());

  final UpdateCartItemByDecrementUseCase updateCartItemByDecrementUseCase;

  Future<void> decrementCartItemQuantity({required String productId}) async {
    emit(DecrementCartItemQuantityLoadingState());
    final result = await updateCartItemByDecrementUseCase.call(
      productId: productId,
    );
    result.fold(
      (l) => emit(
        DecrementCartItemQuantityErrorState(errorMessage: l.errorMessage),
      ),
      (r) => emit(DecrementCartItemQuantitySuccessState()),
    );
  }
}
