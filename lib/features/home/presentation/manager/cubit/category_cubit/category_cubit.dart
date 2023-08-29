import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  final FetchCategoryUseCase fetchCategoriesUseCase;

  CategoryCubit(this.fetchCategoriesUseCase) : super(CategoryInitial());

  Future fetchCategories() async {
    emit(FetchCategoryLoading());

    Either<Failure, List<CategoryEntity>> result =
        await fetchCategoriesUseCase.call();

    if (isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(FetchCategoryFailure(failure.message)),
      (categoryEntity) => emit(FetchCategorySuccess(categoryEntity)),
    );
  }
}
