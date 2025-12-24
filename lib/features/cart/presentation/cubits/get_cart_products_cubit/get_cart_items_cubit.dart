import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_cart_items_use_case.dart';

part 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit(this.getCartItemsUseCase) : super(GetCartItemsInitial());

  final GetCartItemsUseCase getCartItemsUseCase;

  Future<void> getCartItems() async {
    emit(GetCartItemsLoadingState());
    final result = await getCartItemsUseCase();
    result.fold(
      (l) => emit(GetCartItemsErrorState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetCartItemsEmptyState());
        } else {
          emit(GetCartItemsSuccessState(cartItems: r));
        }
      },
    );
  }
}
