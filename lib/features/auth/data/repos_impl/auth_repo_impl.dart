import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/failure.dart';
import 'package:shopping_app/core/errors/server_failure.dart';
import 'package:shopping_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserResponseModel>> signUp(
      SignUpModel signUpModel) async {
    try {
      UserResponseModel userResponseModel =
          await authRemoteDataSource.signUp(signUpModel);
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
  Future<Either<Failure, UserResponseModel>> signIn(
      SignInModel signInModel) async {
    try {
      UserResponseModel userResponseModel =
          await authRemoteDataSource.signIn(signInModel);
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
  Future<Either<Failure, SignOutModel>> signOut(String token) async {
    try {
      SignOutModel signOutModel = await authRemoteDataSource.signOut(token);
      return Right(signOutModel);
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
