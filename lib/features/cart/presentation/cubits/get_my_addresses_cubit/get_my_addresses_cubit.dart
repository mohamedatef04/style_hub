import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/get_my_addresses_use_case.dart';
part 'get_my_addresses_state.dart';

class GetMyAddressesCubit extends Cubit<GetMyAddressesState> {
  GetMyAddressesCubit(this.getMyAddressesUseCase)
    : super(GetMyAddressesInitial());

  final GetMyAddressesUseCase getMyAddressesUseCase;

  Future<void> getMyAddresses() async {
    emit(GetMyAddressesLoadingState());
    final result = await getMyAddressesUseCase.call();
    result.fold(
      (l) => emit(GetMyAddressesErrorState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetMyAddressesEmptyState());
        } else {
          emit(GetMyAddressesSuccessState(myAddresses: r));
        }
      },
    );
  }
}
