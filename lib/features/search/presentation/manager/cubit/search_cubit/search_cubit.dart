import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';
import 'package:shopping_app/features/search/domain/use_cases/search_for_product_use_case.dart';
import 'package:shopping_app/features/search/presentation/manager/cubit/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchForProductUseCase searchForProductUseCase;

  SearchCubit(this.searchForProductUseCase) : super(SearchInitialState());

  bool isEmpty = true;

  Future searchForProduct(String text) async {
    if (isEmpty) {
      emit(FetchSearchedProductSuccess([]));
    } else {
      emit(FetchSearchedProductLoading());

      Either<Failure, List<SearchEntity>> result =
          await searchForProductUseCase.call(text);

      if (isClosed) {
        return;
      }
      result.fold(
        (failure) => emit(FetchSearchedProductFailure(failure.message)),
        (searchEntity) => emit(
          FetchSearchedProductSuccess(
            isEmpty ? [] : searchEntity,
          ),
        ),
      );
    }
  }
}
