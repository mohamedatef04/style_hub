part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;
  const LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginState {
  final String errorMessage;
  const LoginErrorState({required this.errorMessage});
}
