import 'package:flutter/material.dart';
import 'package:shopping_app/constant.dart';

class CustomGridViewLoading extends StatefulWidget {
  const CustomGridViewLoading({
    Key? key,
    this.shrinkWrap,
  }) : super(key: key);
  final bool? shrinkWrap;

  @override
  State<CustomGridViewLoading> createState() => _CustomGridViewLoadingState();
}

class _CustomGridViewLoadingState extends State<CustomGridViewLoading>
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
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap ?? false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 15,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
      ),
      itemBuilder: (context, index) {
        return Opacity(
          opacity: _animation.value,
          child: Card(
            color: kThirdColor,
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1/1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.028,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.016,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.016,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
