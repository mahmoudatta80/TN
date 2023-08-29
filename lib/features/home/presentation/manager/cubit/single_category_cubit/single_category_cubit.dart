import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_single_category_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/single_category_cubit/single_category_states.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryStates> {
  final FetchSingleCategoryUseCase fetchSingleCategoryUseCase;

  SingleCategoryCubit(this.fetchSingleCategoryUseCase)
      : super(SingleCategoryInitial());

  Future fetchSingleCategories(int id) async {
    emit(FetchSingleCategoryLoading());

    Either<Failure, List<ProductEntity>> result =
        await fetchSingleCategoryUseCase.call(id);

    if(isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(FetchSingleCategoryFailure(failure.message)),
      (productEntity) => emit(FetchSingleCategorySuccess(productEntity)),
    );
  }
}
