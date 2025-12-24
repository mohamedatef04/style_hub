import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/update_address_use_case.dart';
part 'update_address_state.dart';

class UpdateAddressCubit extends Cubit<UpdateAddressState> {
  UpdateAddressCubit(this.updateAddressUseCase) : super(UpdateAddressInitial());
  final UpdateAddressUseCase updateAddressUseCase;

  Future<void> updateAddress({required AddressEntity addressEntity}) async {
    emit(UpdateAddressLoading());
    final result = await updateAddressUseCase(addressEntity: addressEntity);
    result.fold(
      (failure) =>
          emit(UpdateAddressFailure(errorMessage: failure.errorMessage)),
      (success) => emit(UpdateAddressSuccess()),
    );
  }
}
