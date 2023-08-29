class SignInModel {
  late final String email;
  late final String password;

  SignInModel(dynamic obj) {
    email = obj['email'];
    password = obj['password'];
  }
}