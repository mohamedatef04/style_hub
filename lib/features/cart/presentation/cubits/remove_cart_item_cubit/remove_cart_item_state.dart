part of 'remove_cart_item_cubit.dart';

abstract class RemoveCartItemState extends Equatable {
  const RemoveCartItemState();

  @override
  List<Object> get props => [];
}

class RemoveCartItemInitial extends RemoveCartItemState {}

class RemoveCartItemLoadingState extends RemoveCartItemState {}

class RemoveCartItemSuccessState extends RemoveCartItemState {}

class RemoveCartItemErrorState extends RemoveCartItemState {
  final String errorMessage;
  const RemoveCartItemErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
