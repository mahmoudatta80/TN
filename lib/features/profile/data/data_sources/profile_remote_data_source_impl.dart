import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/core/utils/end_points.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserResponseModel> getProfile() async {
    Map<String, dynamic> response =
        await apiService.get(endPoint: EndPoints.profile);
    UserResponseModel userResponseModel = UserResponseModel.fromJson(response);
    return userResponseModel;
  }

  @override
  Future<UserResponseModel> updateProfile(
      UpdateProfileModel updateProfileModel) async {
    Map<String, dynamic> response =
        await apiService.put(endPoint: EndPoints.updateProfile, data: {
      'name': updateProfileModel.name,
      'phone': updateProfileModel.phone,
      'email': updateProfileModel.email,
    });
    UserResponseModel userResponseModel = UserResponseModel.fromJson(response);
    return userResponseModel;
  }

  @override
  Future<UpdateFavouriteModel> updateFavourite(int id) async {
    Map<String, dynamic> response =
        await apiService.post(endPoint: EndPoints.favorites, data: {
      'product_id': id,
    });
    UpdateFavouriteModel favouriteModel = UpdateFavouriteModel.fromJson(response);
    return favouriteModel;
  }
}
