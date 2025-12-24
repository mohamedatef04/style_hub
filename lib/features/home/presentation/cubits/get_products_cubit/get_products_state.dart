part of 'get_products_cubit.dart';

abstract class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoadingState extends GetProductsState {}

class GetProductsSuccessState extends GetProductsState {
  final List<CollectionItemEntity> collectionItems;
  const GetProductsSuccessState({required this.collectionItems});

  @override
  List<Object> get props => [collectionItems];
}

class GetProductsErrorState extends GetProductsState {
  final String errorMessage;
  const GetProductsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
