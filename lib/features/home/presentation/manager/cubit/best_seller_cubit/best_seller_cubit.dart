import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_best_seller_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_states.dart';

class BestSellerCubit extends Cubit<BestSellerStates> {
  final FetchBestSellerUseCase fetchBestSellerUseCase;

  BestSellerCubit(this.fetchBestSellerUseCase) : super(BestSellerInitial());

  Future fetchBestSeller() async {
    emit(FetchBestSellerLoading());

    Either<Failure, List<ProductEntity>> result =
        await fetchBestSellerUseCase.call();

    if(isClosed) {
      return;
    }
    result.fold(
      (failure) => emit(FetchBestSellerFailure(failure.message)),
      (productEntity) => emit(FetchBestSellerSuccess(productEntity)),
    );
  }
}
