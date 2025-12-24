import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';
import 'package:style_hub/features/categoreis/domain/use_cases/get_categories_use_case.dart';
part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.getCategoriesUseCase) : super(GetCategoriesInitial());
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await getCategoriesUseCase.call();
    result.fold(
      (failure) =>
          emit(GetCategoriesErrorState(errorMessage: failure.errorMessage)),
      (categories) => emit(GetCategoriesSuccessState(categories: categories)),
    );
  }
}
