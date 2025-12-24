part of 'remove_address_cubit.dart';

abstract class RemoveAddressState extends Equatable {
  const RemoveAddressState();

  @override
  List<Object> get props => [];
}

class RemoveAddressInitial extends RemoveAddressState {}

class RemoveAddressLoading extends RemoveAddressState {}

class RemoveAddressSuccess extends RemoveAddressState {}

class RemoveAddressFailure extends RemoveAddressState {
  final String errorMessage;
  const RemoveAddressFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
