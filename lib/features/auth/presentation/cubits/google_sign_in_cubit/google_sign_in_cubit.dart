import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/services/google_auth_service.dart';
import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';
import 'package:style_hub/features/auth/domain/use_cases/google_sign_in_use_case.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInUseCase googleSignInUseCase;
  final GoogleAuthService googleAuthService;

  GoogleSignInCubit(this.googleSignInUseCase, this.googleAuthService)
    : super(GoogleSignInInitial());

  Future<void> loginWithGoogle() async {
    emit(GoogleSignInLoadingState());

    final idToken = await googleAuthService.getIdToken();

    if (idToken == null) {
      emit(const GoogleSignInErrorState(errorMessage: "Login failed"));
      return;
    }

    final result = await googleSignInUseCase(idToken: idToken);

    result.fold(
      (failure) {
        emit(GoogleSignInErrorState(errorMessage: failure.errorMessage));
      },
      (data) {
        emit(GoogleSignInSuccessState(loginResponseEntity: data));
      },
    );
  }
}
