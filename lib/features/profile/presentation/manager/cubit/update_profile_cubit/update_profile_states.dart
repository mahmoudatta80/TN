import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';

abstract class UpdateProfileStates {}

class UpdateProfileInitialState extends UpdateProfileStates {}

class UpdateProfileLoadingState extends UpdateProfileStates {}

class UpdateProfileSuccessState extends UpdateProfileStates {
  final UserResponseModel userResponseModel;

  UpdateProfileSuccessState(this.userResponseModel);
}

class UpdateProfileFailureState extends UpdateProfileStates {
  final String errorMessage;

  UpdateProfileFailureState(this.errorMessage);
}
