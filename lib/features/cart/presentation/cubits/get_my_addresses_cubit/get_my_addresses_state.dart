part of 'get_my_addresses_cubit.dart';

abstract class GetMyAddressesState extends Equatable {
  const GetMyAddressesState();

  @override
  List<Object> get props => [];
}

class GetMyAddressesInitial extends GetMyAddressesState {}

class GetMyAddressesLoadingState extends GetMyAddressesState {}

class GetMyAddressesEmptyState extends GetMyAddressesState {}

class GetMyAddressesSuccessState extends GetMyAddressesState {
  final List<AddressEntity> myAddresses;
  const GetMyAddressesSuccessState({required this.myAddresses});

  @override
  List<Object> get props => [myAddresses];
}

class GetMyAddressesErrorState extends GetMyAddressesState {
  final String errorMessage;
  const GetMyAddressesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
