part of 'get_category_products_cubit.dart';

abstract class GetCategoryProductsState extends Equatable {
  const GetCategoryProductsState();

  @override
  List<Object> get props => [];
}

class GetCategoryProductsInitial extends GetCategoryProductsState {}

class GetCategoryProductsLoadingState extends GetCategoryProductsState {}

class GetCategoryProductsSuccessState extends GetCategoryProductsState {
  final List<CollectionItemEntity> categoryProducts;
  const GetCategoryProductsSuccessState({required this.categoryProducts});

  @override
  List<Object> get props => [categoryProducts];
}

class GetCategoryProductsErrorState extends GetCategoryProductsState {
  final String errorMessage;
  const GetCategoryProductsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
