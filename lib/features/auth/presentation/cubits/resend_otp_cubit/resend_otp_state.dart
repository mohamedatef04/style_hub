part of 'resend_otp_cubit.dart';

abstract class ResendOtpState extends Equatable {
  const ResendOtpState();

  @override
  List<Object> get props => [];
}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoadingState extends ResendOtpState {}

class ResendOtpSuccessState extends ResendOtpState {}

class ResendOtpFailureState extends ResendOtpState {
  final String errorMessage;
  const ResendOtpFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
