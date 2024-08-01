import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/repository/home_repo.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/home/bloc/home_bloc.dart';
import 'package:watch_store_app/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store_app/screens/product_list/product_list_screen.dart';
import 'package:watch_store_app/widgets/app_slider_widget.dart';
import 'package:watch_store_app/widgets/cat_widget.dart';
import 'package:watch_store_app/widgets/product_item_widget.dart';
import 'package:watch_store_app/widgets/search_bar_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository)..add(HomeInitEvent()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is HomeSuccessLoadState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBarButton(onTap: () {}),
                    AppSliderWidget(
                      slides: state.home.data.slides,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.home.data.categories.length,
                        itemBuilder: (context, index) {
                          final CategorySlideModel categoryData =
                              state.home.data.categories[index];
                          List<Color> colors = AppColors.catColors[index % 4];
                          return CatWidget(
                              colors: colors,
                              ontap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) =>
                                        ProductListBloc(productRepository)
                                          ..add(
                                            ProductListInitialEvent(
                                              categoryData.id,
                                            ),
                                          ),
                                    child: ProductListScreen(
                                        title: categoryData.title),
                                  ),
                                ));
                              },
                              title: categoryData.title,
                              iconPath: categoryData.image);
                        },
                      ),
                    ),
                    AppDimens.large.heightSizedBox,
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.home.data.amazingProducts.length + 1,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return const VerticalText();
                          }
                          final ProductModel productModel =
                              state.home.data.amazingProducts[index - 1];
                          return ProductWidget(
                            productModel: productModel,
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              throw Exception("invalid State");
            }
          },
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.viewAll),
                4.widthSizedBox,
                Transform.rotate(
                    angle: 1.55, child: SvgPicture.asset(Assets.images.back)),
              ],
            ),
            4.heightSizedBox,
            Text(
              AppStrings.amazing,
              style: themeData.textTheme.titleLarge!
                  .copyWith(color: AppColors.amazingColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
