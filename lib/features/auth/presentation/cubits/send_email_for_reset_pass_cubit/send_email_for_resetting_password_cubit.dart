import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/send_email_for_reset_pass_use_case.dart';
part 'send_email_for_resetting_password_state.dart';

class SendEmailForResettingPasswordCubit
    extends Cubit<SendEmailForResettingPasswordState> {
  SendEmailForResettingPasswordCubit(this.sendEmailForResetPassUseCase)
    : super(SendEmailForResettingPasswordInitial());

  final SendEmailForResetPassUseCase sendEmailForResetPassUseCase;

  Future<void> sendEmailForResettingPassword({required String email}) async {
    emit(SendEmailForResettingPasswordLoadingState());
    final result = await sendEmailForResetPassUseCase(email: email);
    result.fold(
      (l) => emit(
        SendEmailForResettingPasswordErrorState(errorMessage: l.errorMessage),
      ),
      (r) => emit(SendEmailForResettingPasswordSuccessState()),
    );
  }
}
