import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class GetProfileStates{}

class GetProfileInitialState extends GetProfileStates{}

class GetProfileLoadingState extends GetProfileStates{}

class GetProfileSuccessState extends GetProfileStates{
  final UserResponseModel userResponseModel;

  GetProfileSuccessState(this.userResponseModel);
}

class GetProfileFailureState extends GetProfileStates{
  final String errorMessage;

  GetProfileFailureState(this.errorMessage);
}