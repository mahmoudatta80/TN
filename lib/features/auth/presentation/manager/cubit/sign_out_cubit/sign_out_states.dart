import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';

abstract class SignOutStates {}

class SignOutInitialState extends SignOutStates {}

class SignOutLoadingState extends SignOutStates {}

class SignOutSuccessState extends SignOutStates {
  final SignOutModel signOutModel;

  SignOutSuccessState(this.signOutModel);
}

class SignOutFailureState extends SignOutStates {
  final String errorMessage;

  SignOutFailureState(this.errorMessage);
}
