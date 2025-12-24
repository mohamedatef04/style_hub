import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_to_cart_use_case.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartUseCase) : super(AddToCartInitial());
  final AddToCartUseCase addToCartUseCase;

  Future<void> addToCart({
    required String productId,
    required int quantity,
  }) async {
    emit(AddToCartLoadingState());
    final res = await addToCartUseCase.call(
      productId: productId,
      quantity: quantity,
    );
    res.fold(
      (l) => emit(AddToCartErrorState(errorMessage: l.errorMessage)),
      (r) => emit(AddToCartSuccessState()),
    );
  }
}
