part of 'get_search_items_cubit.dart';

abstract class GetSearchItemsState extends Equatable {
  const GetSearchItemsState();

  @override
  List<Object> get props => [];
}

class GetSearchItemsInitial extends GetSearchItemsState {}

class GetSearchItemsLoadingState extends GetSearchItemsState {}

class GetSearchItemsEmptyState extends GetSearchItemsState {}

class GetSearchItemsSuccessState extends GetSearchItemsState {
  final List<CollectionItemEntity> collectionItems;
  const GetSearchItemsSuccessState({required this.collectionItems});

  @override
  List<Object> get props => [collectionItems];
}

class GetSearchItemsErrorState extends GetSearchItemsState {
  final String errorMessage;
  const GetSearchItemsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
