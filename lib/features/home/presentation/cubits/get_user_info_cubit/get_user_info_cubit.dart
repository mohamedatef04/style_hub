import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/home/domain/entities/user_entity.dart';
import 'package:style_hub/features/home/domain/use_cases/get_user_info_use_case.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this.getUserInfoUseCase) : super(GetUserInfoInitial());

  final GetUserInfoUseCase getUserInfoUseCase;

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoadingState());
    final result = await getUserInfoUseCase.call();
    result.fold(
      (failure) =>
          emit(GetUserInfoErrorState(errorMessage: failure.errorMessage)),
      (user) => emit(GetUserInfoSuccessState(userEntity: user)),
    );
  }
}
