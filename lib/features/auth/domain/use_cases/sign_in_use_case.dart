import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/auth/domain/repos/auth_repo.dart';

class SignInUseCase extends UseCaseWithParam<UserResponseModel, SignInModel> {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserResponseModel>> call(SignInModel param) async{
    return await authRepo.signIn(param);
  }
}