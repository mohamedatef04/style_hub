import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_cart_item_use_case.dart';
part 'remove_cart_item_state.dart';

class RemoveCartItemCubit extends Cubit<RemoveCartItemState> {
  RemoveCartItemCubit(this.removeCartItemUseCase)
    : super(RemoveCartItemInitial());
  final RemoveCartItemUseCase removeCartItemUseCase;

  Future<void> removeCartItem({
    required String productId,
    required String itemId,
  }) async {
    emit(RemoveCartItemLoadingState());
    final result = await removeCartItemUseCase.call(
      productId: productId,
      itemId: itemId,
    );
    result.fold(
      (l) => emit(RemoveCartItemErrorState(errorMessage: l.errorMessage)),
      (r) => emit(RemoveCartItemSuccessState()),
    );
  }
}
