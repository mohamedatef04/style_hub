part of 'update_address_cubit.dart';

sealed class UpdateAddressState extends Equatable {
  const UpdateAddressState();

  @override
  List<Object> get props => [];
}

final class UpdateAddressInitial extends UpdateAddressState {}

final class UpdateAddressLoading extends UpdateAddressState {}

final class UpdateAddressSuccess extends UpdateAddressState {}

final class UpdateAddressFailure extends UpdateAddressState {
  final String errorMessage;

  const UpdateAddressFailure({required this.errorMessage});
}
