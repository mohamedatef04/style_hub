import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/home/domain/use_cases/get_products_use_case.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.getProductsUseCase) : super(GetProductsInitial());
  final GetProductsUseCase getProductsUseCase;

  Future<void> getProducts({
    required int page,
  }) async {
    emit(GetProductsLoadingState());
    final result = await getProductsUseCase.call(
      page: page,
    );
    result.fold(
      (l) => emit(GetProductsErrorState(errorMessage: l.errorMessage)),
      (r) {
        emit(GetProductsSuccessState(collectionItems: r));
      },
    );
  }
}
