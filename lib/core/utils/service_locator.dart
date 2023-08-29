import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:shopping_app/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:shopping_app/features/cart/data/data_sources/cart_remote_data_source/cart_remote_data_source_impl.dart';
import 'package:shopping_app/features/cart/data/repos_impl/cart_repo_impl.dart';
import 'package:shopping_app/features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:shopping_app/features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import 'package:shopping_app/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:shopping_app/features/profile/data/data_sources/profile_remote_data_source_impl.dart';
import 'package:shopping_app/features/profile/data/repos_impl/profile_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<HomeRemoteDataSourceImpl>(),
      HomeLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<FetchCategoryUseCase>(
    FetchCategoryUseCase(
      getIt.get<HomeRepoImpl>(),
    ),
  );

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
    AuthRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<AuthRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<ProfileRemoteDataSourceImpl>(
    ProfileRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt.get<ProfileRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<CartRemoteDataSourceImpl>(
    CartRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      getIt.get<CartRemoteDataSourceImpl>(),
    ),
  );
}
