import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:shopping_app/features/profile/domain/repos/profile_repo.dart';

class UpdateProfileUseCase
    extends UseCaseWithParam<UserResponseModel, UpdateProfileModel> {
  final ProfileRepo profileRepo;

  UpdateProfileUseCase(this.profileRepo);

  @override
  Future<Either<Failure, UserResponseModel>> call(
      UpdateProfileModel param) async {
    return await profileRepo.updateProfile(param);
  }
}
