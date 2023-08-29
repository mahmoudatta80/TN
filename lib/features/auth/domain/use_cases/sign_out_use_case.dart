import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/use_cases/use_case_with_param.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/domain/repos/auth_repo.dart';

class SignOutUseCase extends UseCaseWithParam<SignOutModel, String> {
  final AuthRepo authRepo;

  SignOutUseCase(this.authRepo);

  @override
  Future<Either<Failure, SignOutModel>> call(String param) async {
    return await authRepo.signOut(param);
  }
}
