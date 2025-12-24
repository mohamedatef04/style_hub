import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/reset_pass_use_case.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPassUseCase) : super(ResetPasswordInitial());

  final ResetPassUseCase resetPassUseCase;

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    emit(ResetPasswordLoadingState());
    final result = await resetPassUseCase(
      email: email,
      otp: otp,
      password: password,
    );
    result.fold(
      (l) => emit(ResetPasswordErrorState(errorMessage: l.errorMessage)),
      (r) => emit(ResetPasswordSuccessState()),
    );
  }
}
