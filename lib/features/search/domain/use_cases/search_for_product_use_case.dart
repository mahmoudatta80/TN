import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/search/domain/entities/search_entity.dart';
import 'package:shopping_app/features/search/domain/repos/search_repo.dart';

class SearchForProductUseCase extends UseCaseWithParam<List<SearchEntity>, String> {
  final SearchRepo searchRepo;

  SearchForProductUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<SearchEntity>>> call(String param) async{
    return await searchRepo.searchForProduct(param);
  }
}