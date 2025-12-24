import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/use_cases/remove_address_use_case.dart';
part 'remove_address_state.dart';

class RemoveAddressCubit extends Cubit<RemoveAddressState> {
  RemoveAddressCubit(this.removeAddressUseCase) : super(RemoveAddressInitial());
  final RemoveAddressUseCase removeAddressUseCase;

  Future<void> removeAddress({required String addressId}) async {
    emit(RemoveAddressLoading());
    final result = await removeAddressUseCase.call(addressId: addressId);
    result.fold(
      (failure) =>
          emit(RemoveAddressFailure(errorMessage: failure.errorMessage)),
      (r) => emit(RemoveAddressSuccess()),
    );
  }
}
