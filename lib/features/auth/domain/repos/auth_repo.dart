import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserResponseModel>> signUp(SignUpModel signUpModel);
  Future<Either<Failure, UserResponseModel>> signIn(SignInModel signInModel);
  Future<Either<Failure, SignOutModel>> signOut(String token);
}