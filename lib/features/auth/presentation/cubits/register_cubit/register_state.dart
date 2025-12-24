part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  const RegisterErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
