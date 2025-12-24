import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';
import 'package:style_hub/features/home/domain/use_cases/get_offers_use_case.dart';
part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(this.getOffersUseCase) : super(GetOffersInitial());

  final GetOffersUseCase getOffersUseCase;

  Future<void> getOffers() async {
    emit(GetOffersLoadingState());
    final result = await getOffersUseCase.call();
    result.fold(
      (failure) =>
          emit(GetOffersErrorState(errorMessage: failure.errorMessage)),
      (offers) => emit(GetOffersSuccessState(offers: offers)),
    );
  }
}
