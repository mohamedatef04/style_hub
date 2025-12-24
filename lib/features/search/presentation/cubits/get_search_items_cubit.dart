import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';
import 'package:style_hub/features/search/domain/use_cases/get_search_items_use_case.dart';
part 'get_search_items_state.dart';

class GetSearchItemsCubit extends Cubit<GetSearchItemsState> {
  GetSearchItemsCubit(this.getSearchItemsUseCase)
    : super(GetSearchItemsInitial());
  final GetSearchItemsUseCase getSearchItemsUseCase;

  Future<void> getSearchItems({required String query}) async {
    final result = await getSearchItemsUseCase.call(query: query);
    result.fold(
      (l) => emit(GetSearchItemsErrorState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetSearchItemsEmptyState());
        } else {
          emit(GetSearchItemsSuccessState(collectionItems: r));
        }
      },
    );
  }
}
