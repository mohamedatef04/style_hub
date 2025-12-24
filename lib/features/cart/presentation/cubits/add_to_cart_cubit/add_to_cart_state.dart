part of 'add_to_cart_cubit.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {}

class AddToCartErrorState extends AddToCartState {
  final String errorMessage;
  const AddToCartErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
