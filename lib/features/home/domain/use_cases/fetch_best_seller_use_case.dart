import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_no_param.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/repos/home_repo.dart';

class FetchBestSellerUseCase extends UseCaseWithNoParam<List<ProductEntity>>{
  final HomeRepo homeRepo;

  FetchBestSellerUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async{
    return await homeRepo.fetchBestSeller();
  }
}