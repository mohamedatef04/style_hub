part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  final String errorMessage;
  const ResetPasswordErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
