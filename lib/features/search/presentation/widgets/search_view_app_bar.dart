import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/utils/app_locale.dart';
import 'package:shopping_app/core/widgets/custom_form_field.dart';
import 'package:shopping_app/features/search/presentation/manager/cubit/search_cubit/search_cubit.dart';

class SearchViewAppBar extends StatefulWidget {
  const SearchViewAppBar({Key? key}) : super(key: key);

  @override
  State<SearchViewAppBar> createState() => _SearchViewAppBarState();
}

class _SearchViewAppBarState extends State<SearchViewAppBar> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      color: kThirdColor,
      child: CustomFormField(
        text: getLang(context, 'search'),
        controller: controller,
        textInputType: TextInputType.text,
        onSubmit: (text) {
          if (text.isEmpty) {
            searchCubit.isEmpty = true;
            searchCubit.searchForProduct(text);
          }else {
            searchCubit.isEmpty = false;
            searchCubit.searchForProduct(text);
          }
        },
        suffixIcon: const Icon(
          Icons.search_outlined,
        ),
      ),
    );
  }
}
