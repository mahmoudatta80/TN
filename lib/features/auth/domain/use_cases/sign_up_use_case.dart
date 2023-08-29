import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/auth/domain/repos/auth_repo.dart';

class SignUpUseCase extends UseCaseWithParam<UserResponseModel, SignUpModel> {
  final AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserResponseModel>> call(SignUpModel param) async{
    return await authRepo.signUp(param);
  }
}