part of 'add_new_address_cubit.dart';

abstract class AddNewAddressState extends Equatable {
  const AddNewAddressState();

  @override
  List<Object> get props => [];
}

class AddNewAddressInitial extends AddNewAddressState {}

class AddNewAddressLoadingState extends AddNewAddressState {}

class AddNewAddressSuccessState extends AddNewAddressState {}

class AddNewAddressErrorState extends AddNewAddressState {
  final String errorMessage;
  const AddNewAddressErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
