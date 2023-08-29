import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/core/functions/clear_boxes.dart';
import 'package:shopping_app/features/cart/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/functions/navigate_to_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_cubit.dart';
import 'package:shopping_app/features/profile/presentation/manager/cubit/update_lang_cubit/update_lang_states.dart';
import 'package:shopping_app/features/profile/presentation/widgets/update_lang_loading.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: BlocConsumer<UpdateLangCubit, UpdateLangStates>(
        listener: (context, state) {
          if (state is UpdateLangSuccessState) {
            BlocProvider.of<CartCubit>(context).totalCartPrice = 0;
            clearBoxes().then((value) {
              navigateToLayout(context);
            });
          }
        },
        builder: (context, state) {
          UpdateLangCubit updateLangCubit =
              BlocProvider.of<UpdateLangCubit>(context);
          if (state is UpdateLangLoadingState) {
            return UpdateLangLoading(
              message: kLang == 'en'
                  ? 'جاري اعداد اللغة العربية'
                  : 'The English language is being prepared',
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1.5,
              color: kSecondaryColor.withOpacity(.5),
              endIndent: 20,
              indent: 20,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  updateLangCubit.updateLang(updateLangCubit.languages[index], context);
                },
                title: Text(updateLangCubit.languages[index]),
                trailing: kLang == updateLangCubit.languages[index]
                    ? const Icon(Icons.check)
                    : null,
              );
            },
            itemCount: updateLangCubit.languages.length,
          );
        },
      ),
    );
  }
}
