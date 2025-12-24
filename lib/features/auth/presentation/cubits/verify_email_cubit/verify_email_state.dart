part of 'verify_email_cubit.dart';

abstract class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class VerifyEmailSuccessState extends VerifyEmailState {}

class VerifyEmailErrorState extends VerifyEmailState {
  final String message;
  const VerifyEmailErrorState({required this.message});
}
