import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_no_param.dart';
import 'package:shopping_app/features/home/domain/entities/category/category_entity.dart';
import 'package:shopping_app/features/home/domain/repos/home_repo.dart';

class FetchCategoryUseCase extends UseCaseWithNoParam<List<CategoryEntity>>{
  final HomeRepo homeRepo;

  FetchCategoryUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async{
    return await homeRepo.fetchCategories();
  }
}