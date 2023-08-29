import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/errors/server_failure.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:shopping_app/features/profile/data/models/update_favourite_model/update_favourite_model.dart';
import 'package:shopping_app/features/profile/data/models/update_profile_model/update_profile_model.dart';
import 'package:shopping_app/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, UserResponseModel>> getProfile() async {
    try {
      UserResponseModel userResponseModel =
          await profileRemoteDataSource.getProfile();
      return Right(userResponseModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UserResponseModel>> updateProfile(
      UpdateProfileModel updateProfileModel) async {
    try {
      UserResponseModel userResponseModel =
          await profileRemoteDataSource.updateProfile(updateProfileModel);
      return Right(userResponseModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UpdateFavouriteModel>> updateFavourite(int id) async {
    try {
      UpdateFavouriteModel updateFavouriteModel =
          await profileRemoteDataSource.updateFavourite(id);
      return Right(updateFavouriteModel);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }
}
