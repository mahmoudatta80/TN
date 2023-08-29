import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/poster_cubit/poster_cubit.dart';
import 'package:shopping_app/features/home/presentation/manager/cubit/poster_cubit/poster_states.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_indicator.dart';
import 'package:shopping_app/features/home/presentation/widgets/page_view_loading.dart';
import 'package:shopping_app/features/home/presentation/widgets/poster.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: BlocBuilder<PosterCubit, PosterStates>(
            builder: (context, state) {
              if (state is FetchPostersSuccess) {
                return PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Poster(
                      posterEntity: state.posters[index],
                    );
                  },
                  itemCount: 3,
                );
              } else if (state is FetchPostersFailure) {
                return Text(
                  state.errorMessage,
                );
              } else {
                return PageViewLoading(
                  pageController: pageController,
                );
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        CustomIndicator(
          pageController: pageController,
        ),
      ],
    );
  }
}
