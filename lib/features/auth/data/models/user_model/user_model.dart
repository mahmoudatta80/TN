class UserModel {
  late final String userName;
  late final String userImage;
  late final int userId;
  late final String userEmail;
  late final String userPhone;
  late final String userToken;

  UserModel({
    required this.userName,
    required this.userImage,
    required this.userId,
    required this.userEmail,
    required this.userPhone,
    required this.userToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['name'],
      userImage: json['image'],
      userId: json['id'],
      userEmail: json['email'],
      userPhone: json['phone'],
      userToken: json['token'],
    );
  }
}
