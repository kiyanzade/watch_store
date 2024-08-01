import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/dimens.dart';

class CatWidget extends StatelessWidget {
  final String title;
  final Function() ontap;
  final List<Color> colors;
  final String iconPath;
  const CatWidget({
    super.key,
    required this.colors,
    required this.ontap,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            height: size.height * .1,
            width: size.height * .1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors),
              borderRadius: BorderRadius.circular(AppDimens.large),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60, child: Image.network(iconPath)),
              ],
            ),
          ),
          const SizedBox(
            height: AppDimens.small * .5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
