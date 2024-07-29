import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/gen/assets.gen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.count = 0});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: [
          const SizedBox(
            height: 32,
            width: 32,
          ),
          SvgPicture.asset(
            Assets.images.cart,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Visibility(
              visible: count > 0 ? true : false,
              child: Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
