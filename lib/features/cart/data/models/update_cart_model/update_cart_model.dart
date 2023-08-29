class UpdateCartModel{
  late final bool status;
  late final String message;

  UpdateCartModel({
    required this.status,
    required this.message,
  });

  factory UpdateCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartModel(
      status: json['status'],
      message: json['message'],
    );
  }
}