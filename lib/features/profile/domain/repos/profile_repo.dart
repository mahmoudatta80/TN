import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserResponseModel>> getProfile();

  Future<Either<Failure, UserResponseModel>> updateProfile(
      UpdateProfileModel updateProfileModel);

  Future<Either<Failure, UpdateFavouriteModel>> updateFavourite(int id);
}
