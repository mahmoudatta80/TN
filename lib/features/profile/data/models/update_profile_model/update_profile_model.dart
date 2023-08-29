class UpdateProfileModel {
  late final String name;
  late final String phone;
  late final String email;

  UpdateProfileModel(dynamic obj) {
    name = obj['name'];
    phone = obj['phone'];
    email = obj['email'];
  }
}
