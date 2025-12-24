part of 'get_categories_cubit.dart';

abstract class GetCategoriesState extends Equatable {
  const GetCategoriesState();

  @override
  List<Object> get props => [];
}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesSuccessState extends GetCategoriesState {
  final List<CategoryEntity> categories;
  const GetCategoriesSuccessState({required this.categories});

  @override
  List<Object> get props => [categories];
}

class GetCategoriesErrorState extends GetCategoriesState {
  final String errorMessage;
  const GetCategoriesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
