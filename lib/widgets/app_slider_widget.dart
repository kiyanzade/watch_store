import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';

final List<String> imgs = [
  'https://ttbol.ir/wp-content/uploads/2020/07/New-Bitmap-Image-copy-1-Copy-1.jpg',
  'https://ttbol.ir/wp-content/uploads/2020/07/New-Bitmap-Image-copy-1-Copy-1.jpg',
  'https://ttbol.ir/wp-content/uploads/2020/07/New-Bitmap-Image-copy-1-Copy-1.jpg',
  'https://ttbol.ir/wp-content/uploads/2020/07/New-Bitmap-Image-copy-1-Copy-1.jpg',

];

class AppSliderWidget extends StatefulWidget {
  const AppSliderWidget({
    super.key,
  });

  @override
  State<AppSliderWidget> createState() => _AppSliderWidgetState();
}

class _AppSliderWidgetState extends State<AppSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<Widget> items = imgs
      .map(
        (e) => Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            child: Image.network(
              e,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          CarouselSlider(
              carouselController: _controller,
              items: imgs
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(AppDimens.medium),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.medium),
                            child: Image.network(
                              e,
                              fit: BoxFit.cover,
                            )),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgs
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _controller.animateToPage(e.key),
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == e.key
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
