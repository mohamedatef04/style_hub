import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/validate_otp_use_case.dart';
part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  ValidateOtpCubit(this.validateOtpUseCase) : super(ValidateOtpInitial());

  final ValidateOtpUseCase validateOtpUseCase;

  Future<void> validateOtp({required String otp, required String email}) async {
    emit(ValidateOtpLoadingState());
    final result = await validateOtpUseCase(email: email, otp: otp);
    result.fold(
      (l) => emit(ValidateOtpErrorState(errorMessage: l.errorMessage)),
      (r) => emit(ValidateOtpSuccessState()),
    );
  }
}
