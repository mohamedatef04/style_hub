part of 'google_sign_in_cubit.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoadingState extends GoogleSignInState {}

class GoogleSignInSuccessState extends GoogleSignInState {
  final LoginResponseEntity loginResponseEntity;

  const GoogleSignInSuccessState({required this.loginResponseEntity});

  @override
  List<Object> get props => [loginResponseEntity];
}

class GoogleSignInErrorState extends GoogleSignInState {
  final String errorMessage;

  const GoogleSignInErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
