import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/widgets/suraface_conainer_widget.dart';

class ShoppingCartItemWidget extends StatelessWidget {
  final String name;
  final int price;
  final int oldPrice;
  const ShoppingCartItemWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SurfaceContainer(
        child: Row(
      children: [
        Image.asset(
          Assets.images.unnamed.path,
          height: 110,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: themeData.textTheme.titleLarge,
              ),
              4.heightSizedBox,
              Text(
                "قیمت  : ${price.toString().seRagham()} تومان",
                style: themeData.textTheme.titleMedium,
              ),
              Visibility(
                visible: true,
                child: Text(
                  "با تخفیف: ${oldPrice.toString().seRagham()}  تومان",
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.images.plus)),
                  const Text("عدد 2"),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.images.minus)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.images.delete)),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
