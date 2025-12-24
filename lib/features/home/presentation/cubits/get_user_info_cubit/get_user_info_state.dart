part of 'get_user_info_cubit.dart';

abstract class GetUserInfoState extends Equatable {
  const GetUserInfoState();

  @override
  List<Object> get props => [];
}

class GetUserInfoInitial extends GetUserInfoState {}

class GetUserInfoLoadingState extends GetUserInfoState {}

class GetUserInfoSuccessState extends GetUserInfoState {
  final UserEntity userEntity;
  const GetUserInfoSuccessState({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class GetUserInfoErrorState extends GetUserInfoState {
  final String errorMessage;
  const GetUserInfoErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
