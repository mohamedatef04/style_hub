part of 'get_offers_cubit.dart';

abstract class GetOffersState extends Equatable {
  const GetOffersState();

  @override
  List<Object> get props => [];
}

class GetOffersInitial extends GetOffersState {}

class GetOffersLoadingState extends GetOffersState {}

class GetOffersSuccessState extends GetOffersState {
  final List<OfferEntity> offers;
  const GetOffersSuccessState({required this.offers});

  @override
  List<Object> get props => [offers];
}

class GetOffersErrorState extends GetOffersState {
  final String errorMessage;
  const GetOffersErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
