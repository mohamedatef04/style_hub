import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';
import 'package:style_hub/features/auth/domain/use_cases/login_use_case.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await loginUseCase.call(email: email, password: password);
    response.fold(
      (l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
      (r) => emit(LoginSuccessState(loginResponseEntity: r)),
    );
  }
}
