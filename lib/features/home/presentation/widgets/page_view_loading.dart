import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class PageViewLoading extends StatefulWidget {
  final PageController pageController;
  const PageViewLoading({Key? key, required this.pageController}) : super(key: key);

  @override
  State<PageViewLoading> createState() => _PageViewLoadingState();
}

class _PageViewLoadingState extends State<PageViewLoading> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    _animation =
        Tween<double>(begin: .2, end: .8).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(
        reverse: true, period: const Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: widget.pageController,
      itemBuilder: (context, index) {
        return Opacity(
          opacity: _animation.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: kThirdColor,
              ),
            ),
          ),
        );
      },
      itemCount: 3,
    );
  }
}
