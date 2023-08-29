import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_best_seller_use_case.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_posters_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/poster_cubit/poster_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/layout_view.dart';
import 'package:shopping_app/features/search/data/data_sources/search_remote_data_source_impl.dart';
import 'package:shopping_app/features/search/data/repos_impl/search_repo_impl.dart';
import 'package:shopping_app/features/search/domain/use_cases/search_for_product_use_case.dart';
import 'package:shopping_app/features/search/presentation/manager/cubit/search_cubit/search_cubit.dart';

class LayoutProvider extends StatelessWidget {
  const LayoutProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => BestSellerCubit(
            FetchBestSellerUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchBestSeller(),
        ),
        BlocProvider(
          create: (BuildContext context) => PosterCubit(
            FetchPostersUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchPosters(),
        ),
        BlocProvider(
          create: (BuildContext context) => CategoryCubit(
            getIt.get<FetchCategoryUseCase>(),
          )..fetchCategories(),
        ),
        BlocProvider(
          create: (BuildContext context) => SearchCubit(
            SearchForProductUseCase(
              SearchRepoImpl(
                SearchRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: const LayoutView(),
    );
  }
}
