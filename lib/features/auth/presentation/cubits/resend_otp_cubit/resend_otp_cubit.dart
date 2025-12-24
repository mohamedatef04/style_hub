import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/resend_otp_use_case.dart';
part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this.resendOtpUseCase) : super(ResendOtpInitial());

  final ResendOtpUseCase resendOtpUseCase;

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());
    final result = await resendOtpUseCase.call(email: email);
    result.fold(
      (l) => emit(ResendOtpFailureState(errorMessage: l.errorMessage)),
      (r) => emit(ResendOtpSuccessState()),
    );
  }
}
