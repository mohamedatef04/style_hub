part of 'get_cart_items_cubit.dart';

abstract class GetCartItemsState extends Equatable {
  const GetCartItemsState();

  @override
  List<Object> get props => [];
}

class GetCartItemsInitial extends GetCartItemsState {}

class GetCartItemsLoadingState extends GetCartItemsState {}

class GetCartItemsSuccessState extends GetCartItemsState {
  final List<CartItemEntity> cartItems;
  const GetCartItemsSuccessState({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}

class GetCartItemsErrorState extends GetCartItemsState {
  final String errorMessage;
  const GetCartItemsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class GetCartItemsEmptyState extends GetCartItemsState {}
