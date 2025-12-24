import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';
import 'package:style_hub/features/auth/domain/use_cases/register_use_case.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> register({
    required RegisterRequestEntity registerRequestEntity,
  }) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase.call(
      registerRequestEntity: registerRequestEntity,
    );
    result.fold(
      (l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
      (r) => emit(RegisterSuccessState()),
    );
  }
}
