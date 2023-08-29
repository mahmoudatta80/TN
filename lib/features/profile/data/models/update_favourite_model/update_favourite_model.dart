class UpdateFavouriteModel{
  late final bool status;
  late final String message;

  UpdateFavouriteModel({
    required this.status,
    required this.message,
  });

  factory UpdateFavouriteModel.fromJson(Map<String, dynamic> json) {
    return UpdateFavouriteModel(
      status: json['status'],
      message: json['message'],
    );
  }
}