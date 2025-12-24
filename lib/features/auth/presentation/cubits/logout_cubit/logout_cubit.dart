import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitial());
  final LogoutUseCase logoutUseCase;

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await logoutUseCase.call();
    result.fold(
      (failure) => emit(LogoutFailure(errorMessage: failure.errorMessage)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
