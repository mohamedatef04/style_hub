import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/verify_email_use_case.dart';
part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.verifyEmailUseCase) : super(VerifyEmailInitial());

  final VerifyEmailUseCase verifyEmailUseCase;

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(VerifyEmailLoadingState());
    final result = await verifyEmailUseCase.call(email: email, otp: otp);
    result.fold(
      (l) => emit(VerifyEmailErrorState(message: l.errorMessage)),
      (r) => emit(VerifyEmailSuccessState()),
    );
  }
}
