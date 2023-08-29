import 'package:shopping_app/features/auth/data/models/user_model/user_model.dart';

class UserResponseModel {
  late final bool status;
  late final String message;
  UserModel? data;

  UserResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      status: json['status'],
      message: json['message'] ?? '',
      data: json['data'] != null ? UserModel.fromJson(json['data']) : null,
    );
  }
}
