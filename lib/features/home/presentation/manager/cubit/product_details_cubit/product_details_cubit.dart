import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_product_details_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/product_details_cubit/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductDetailsCubit(this.fetchProductDetailsUseCase)
      : super(ProductDetailsInitial());

  Future fetchProductDetails(int id) async {
    emit(FetchProductDetailsLoading());

    Either<Failure, ProductEntity> result =
        await fetchProductDetailsUseCase.call(id);

    if(isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(FetchProductDetailsFailure(failure.message)),
      (productEntity) => emit(FetchProductDetailsSuccess(productEntity)),
    );
  }
}
