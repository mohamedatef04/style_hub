part of 'send_email_for_resetting_password_cubit.dart';

abstract class SendEmailForResettingPasswordState extends Equatable {
  const SendEmailForResettingPasswordState();

  @override
  List<Object> get props => [];
}

class SendEmailForResettingPasswordInitial
    extends SendEmailForResettingPasswordState {}

class SendEmailForResettingPasswordLoadingState
    extends SendEmailForResettingPasswordState {}

class SendEmailForResettingPasswordSuccessState
    extends SendEmailForResettingPasswordState {}

class SendEmailForResettingPasswordErrorState
    extends SendEmailForResettingPasswordState {
  final String errorMessage;
  const SendEmailForResettingPasswordErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
