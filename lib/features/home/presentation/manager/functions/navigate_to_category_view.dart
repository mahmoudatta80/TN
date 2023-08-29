import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_category_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/category_cubit/category_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/category_view.dart';

navigateToCategoryView(context) {
  navigateToFromRToL(
    context: context,
    child: BlocProvider(
      create: (context) => CategoryCubit(
        getIt.get<FetchCategoryUseCase>(),
      )..fetchCategories(),
      child: const CategoryView(),
    ),
  );
}
