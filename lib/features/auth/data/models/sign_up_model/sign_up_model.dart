class SignUpModel {
  late final String name;
  late final String password;
  late final String email;
  late final String phone;

  SignUpModel(dynamic obj) {
    name = obj['name'];
    password = obj['password'];
    email = obj['email'];
    phone = obj['phone'];
  }
}