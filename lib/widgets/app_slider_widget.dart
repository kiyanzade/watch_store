import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/res/dimens.dart';

class AppSliderWidget extends StatefulWidget {
  const AppSliderWidget({
    super.key, required this.slides,
  });

  final List<CategorySlideModel> slides;

  @override
  State<AppSliderWidget> createState() => _AppSliderWidgetState();
}

class _AppSliderWidgetState extends State<AppSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          CarouselSlider(
              carouselController: _controller,
              items: widget.slides
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppDimens.medium),
                        child: Image.network(
                          e.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
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
              children: widget.slides
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
