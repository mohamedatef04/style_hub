part of 'validate_otp_cubit.dart';

abstract class ValidateOtpState extends Equatable {
  const ValidateOtpState();

  @override
  List<Object> get props => [];
}

class ValidateOtpInitial extends ValidateOtpState {}

class ValidateOtpLoadingState extends ValidateOtpState {}

class ValidateOtpSuccessState extends ValidateOtpState {}

class ValidateOtpErrorState extends ValidateOtpState {
  final String errorMessage;
  const ValidateOtpErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
