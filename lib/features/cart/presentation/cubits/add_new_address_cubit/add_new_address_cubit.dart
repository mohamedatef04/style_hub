import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/domain/use_cases/add_new_address_use_case.dart';
part 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  AddNewAddressCubit(this.addNewAddressUseCase) : super(AddNewAddressInitial());
  final AddNewAddressUseCase addNewAddressUseCase;

  Future<void> addNewAddress({required AddressEntity addressEntity}) async {
    emit(AddNewAddressLoadingState());
    final result = await addNewAddressUseCase.call(
      addressEntity: addressEntity,
    );
    result.fold(
      (failure) =>
          emit(AddNewAddressErrorState(errorMessage: failure.errorMessage)),
      (r) => emit(AddNewAddressSuccessState()),
    );
  }
}
