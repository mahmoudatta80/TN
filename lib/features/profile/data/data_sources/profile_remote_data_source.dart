import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserResponseModel> getProfile();

  Future<UserResponseModel> updateProfile(
      UpdateProfileModel updateProfileModel);

  Future<UpdateFavouriteModel> updateFavourite(int id);
}
