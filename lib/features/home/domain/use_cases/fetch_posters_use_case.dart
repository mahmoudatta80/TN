import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_no_param.dart';
import 'package:shopping_app/features/home/domain/entities/poster/poster_entity.dart';
import 'package:shopping_app/features/home/domain/repos/home_repo.dart';

class FetchPostersUseCase extends UseCaseWithNoParam<List<PosterEntity>>{
  final HomeRepo homeRepo;

  FetchPostersUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<PosterEntity>>> call() async{
    return await homeRepo.fetchPosters();
  }
}