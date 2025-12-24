import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_category_products_use_case.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
part 'get_category_products_state.dart';

class GetCategoryProductsCubit extends Cubit<GetCategoryProductsState> {
  GetCategoryProductsCubit(this.categoriesRepo)
    : super(GetCategoryProductsInitial());
  final GetCategoryProductsUseCase categoriesRepo;

  Future<void> getCategoryProducts({required String category}) async {
    emit(GetCategoryProductsLoadingState());
    final result = await categoriesRepo.call(category: category);
    result.fold(
      (failure) => emit(
        GetCategoryProductsErrorState(errorMessage: failure.errorMessage),
      ),
      (products) =>
          emit(GetCategoryProductsSuccessState(categoryProducts: products)),
    );
  }
}
