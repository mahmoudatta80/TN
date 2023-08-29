import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_single_category_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/single_category_cubit/single_category_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/single_category_view.dart';

navigateToSingleCategory(context, {required String title, required int id}) {
  navigateToFromRToL(
    context: context,
    child: BlocProvider(
      create: (context) => SingleCategoryCubit(
        FetchSingleCategoryUseCase(
            getIt.get<HomeRepoImpl>()
        ),
      )..fetchSingleCategories(id),
      child: SingleCategoryView(
        title: title,
      ),
    ),
  );
}
