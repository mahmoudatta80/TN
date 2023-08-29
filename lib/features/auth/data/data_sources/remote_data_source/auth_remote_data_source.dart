import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserResponseModel> signUp(SignUpModel signUpModel);
  Future<UserResponseModel> signIn(SignInModel signInModel);
  Future<SignOutModel> signOut(String token);
}