class SignOutModel {
  late final bool status;
  late final String message;

  SignOutModel({
    required this.status,
    required this.message,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json) {
    return SignOutModel(
      status: json['status'],
      message: json['message'],
    );
  }
}