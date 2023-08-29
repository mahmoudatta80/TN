import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/domain/repos/profile_repo.dart';

class UpdateFavouriteUseCase extends UseCaseWithParam<UpdateFavouriteModel, int> {
  final ProfileRepo profileRepo;

  UpdateFavouriteUseCase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateFavouriteModel>> call(int param) async {
    return await profileRepo.updateFavourite(param);
  }
}
