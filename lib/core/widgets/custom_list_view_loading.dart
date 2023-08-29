import 'package:flutter/material.dart';

class CustomListViewLoading extends StatefulWidget {
  const CustomListViewLoading({
    Key? key,
    required this.builder,
    this.separated,
    this.shrinkWrap,
    required this.axis,
    this.itemCount,
  }) : super(key: key);
  final Widget builder;
  final Widget? separated;
  final Axis axis;
  final bool? shrinkWrap;
  final int? itemCount;

  @override
  State<CustomListViewLoading> createState() => _CustomListViewLoadingState();
}

class _CustomListViewLoadingState extends State<CustomListViewLoading>
    with SingleTickerProviderStateMixin {
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap ?? false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Opacity(
        opacity: _animation.value,
        child: widget.builder,
      ),
      separatorBuilder: (context, index) => widget.separated ?? Container(),
      itemCount: widget.itemCount ?? 5,
    );
  }
}
