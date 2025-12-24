part of 'decrement_cart_item_quantity_cubit.dart';

abstract class DecrementCartItemQuantityState extends Equatable {
  const DecrementCartItemQuantityState();

  @override
  List<Object> get props => [];
}

class DecrementCartItemQuantityInitial extends DecrementCartItemQuantityState {}

class DecrementCartItemQuantityLoadingState
    extends DecrementCartItemQuantityState {}

class DecrementCartItemQuantitySuccessState
    extends DecrementCartItemQuantityState {}

class DecrementCartItemQuantityErrorState
    extends DecrementCartItemQuantityState {
  final String errorMessage;
  const DecrementCartItemQuantityErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
