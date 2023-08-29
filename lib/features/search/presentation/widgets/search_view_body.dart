import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/styles/text_styles.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_grid_view_loading.dart';
import 'package:shopping_app/features/search/presentation/manager/cubit/search_cubit/search_cubit.dart';
import 'package:shopping_app/features/search/presentation/manager/cubit/search_cubit/search_states.dart';
import 'package:shopping_app/features/search/presentation/widgets/impty_search.dart';
import 'package:shopping_app/features/search/presentation/widgets/search_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is FetchSearchedProductSuccess) {
            return Column(
              children: [
                state.searchedProduct.isEmpty
                    ? Container()
                    : Text(
                        '${state.searchedProduct.length} ${getLang(context, 'results found')}',
                        style: Styles.text18.copyWith(
                          color: const Color(0xff261F22),
                        ),
                      ),
                state.searchedProduct.isEmpty
                    ? Container()
                    : const SizedBox(height: 15),
                state.searchedProduct.isEmpty
                    ? const ImptySearch()
                    : SearchGridView(
                        searchedProduct: state.searchedProduct,
                      ),
              ],
            );
          } else if (state is FetchSearchedProductFailure) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          } else if (state is SearchInitialState) {
            return const ImptySearch();
          } else {
            return const CustomGridViewLoading(
              shrinkWrap: true,
            );
          }
        },
      ),
    );
  }
}
