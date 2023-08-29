import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_no_param.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/domain/repos/profile_repo.dart';

class GetProfileUseCase extends UseCaseWithNoParam<UserResponseModel> {
  final ProfileRepo profileRepo;

  GetProfileUseCase(this.profileRepo);

  @override
  Future<Either<Failure, UserResponseModel>> call() async{
    return await profileRepo.getProfile();
  }
}
