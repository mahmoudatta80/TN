import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/home/domain/entities/product/product_entity.dart';
import 'package:shopping_app/features/home/domain/repos/home_repo.dart';

class FetchSingleCategoryUseCase extends UseCaseWithParam<List<ProductEntity>, int>{
  final HomeRepo homeRepo;

  FetchSingleCategoryUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(int param) async{
    return await homeRepo.fetchSingleCategories(param);
  }
}