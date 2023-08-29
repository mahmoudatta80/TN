import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class SignUpStates{}

class SignUpInitialState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{
  final UserResponseModel userResponseModel;

  SignUpSuccessState(this.userResponseModel);
}

class SignUpFailureState extends SignUpStates{
  final String errorMessage;

  SignUpFailureState(this.errorMessage);
}