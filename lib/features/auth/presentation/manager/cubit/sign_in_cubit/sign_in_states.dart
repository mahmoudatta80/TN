import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class SignInStates{}

class SignInInitialState extends SignInStates{}

class SignInLoadingState extends SignInStates{}

class SignInSuccessState extends SignInStates{
  final UserResponseModel userResponseModel;

  SignInSuccessState(this.userResponseModel);
}

class SignInFailureState extends SignInStates{
  final String errorMessage;

  SignInFailureState(this.errorMessage);
}