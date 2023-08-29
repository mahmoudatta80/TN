import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  final String image;
  final double? height;
  final BoxFit? boxFit;

  const CustomCachedNetworkImage({
    Key? key,
    required this.image,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  State<CustomCachedNetworkImage> createState() =>
      _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
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
    return CachedNetworkImage(
      imageUrl: widget.image,
      height: widget.height,
      fit: widget.boxFit,
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error_outline,
          size: 32,
        ),
      ),
    );
  }
}
