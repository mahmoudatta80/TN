import 'package:flutter/material.dart';

class ColorsField extends StatelessWidget {
  const ColorsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List color= const [
      Color(0xffA1C89B),
      Color(0xff52285B),
      Color(0xff2A132E),
      Color(0xff52285B),
      Color(0xff2A132E),
      Color(0xff2A132E),
      Color(0xffC9A19C),
      Color(0xffF73D3D),
      Color(0xffA1C89B),
      Color(0xff2A132E),
      Color(0xffF73D3D),
      Color(0xff52285B),
    ];
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 10,
          bottom: 10,
          end: 60
      ),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 10,
            mainAxisExtent: 20
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.circle,
              size: 18,
              color: color[index],
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
