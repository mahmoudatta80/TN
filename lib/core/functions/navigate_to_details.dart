import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/functions/navigate_to.dart';
import 'package:shopping_app/core/utils/service_locator.dart';
import 'package:shopping_app/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:shopping_app/features/home/domain/use_cases/fetch_product_details_use_case.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:shopping_app/features/home/presentation/views/details_view.dart';

navigateToDetails(context, {required int id}) {
  navigateToFromBToT(
    context: context,
    child: BlocProvider(
      create: (context) => ProductDetailsCubit(
        FetchProductDetailsUseCase(
          getIt.get<HomeRepoImpl>(),
        ),
      )..fetchProductDetails(id),
      child: const DetailsView(),
    ),
  );
}
