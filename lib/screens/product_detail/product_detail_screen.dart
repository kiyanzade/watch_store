import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/product_detail_model.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData themeData = Theme.of(context);
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductDetailLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductDetailErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductDetailSuccessState) {
          return Scaffold(
            appBar: customAppBarWidget(
              context: context,
              title: Text(state.productDetail.data.title),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(24,0,24,8),
              child: ElevatedButtomWidget(
                  title: const Text(AppStrings.addToBasket), onPressed: () {}),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    state.productDetail.data.image,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppDimens.medium),
                    margin: const EdgeInsets.all(AppDimens.medium),
                    decoration: BoxDecoration(
                      color: AppColors.mainBg,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow.withOpacity(0.1),
                          blurRadius: 5,
                        )
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimens.medium),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.productDetail.data.brand,
                          style: themeData.textTheme.titleLarge,
                        ),
                        AppDimens.small.heightSizedBox,
                        Text(
                          state.productDetail.data.title,
                          style: themeData.textTheme.titleMedium,
                        ),
                        const Divider(),
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                dividerColor: Colors.transparent,
                                labelColor: AppColors.primaryColor,
                                indicatorColor: AppColors.primaryColor,
                                tabs: [
                                  Tab(
                                    text: 'خصوصیات',
                                  ),
                                  Tab(
                                    text: 'نقد و بررسی',
                                  ),
                                  Tab(
                                    text: 'نظرات',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 500,
                                child: TabBarView(children: [
                                  ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state
                                        .productDetail.data.properties.length,
                                    itemBuilder: (context, index) {
                                      final Property property = state
                                          .productDetail.data.properties[index];
                                      return Container(
                                        margin: const EdgeInsets.all(
                                            AppDimens.medium),
                                        padding: const EdgeInsets.all(
                                            AppDimens.medium),
                                        decoration: BoxDecoration(
                                          color: AppColors.surfaceColor,
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.medium),
                                        ),
                                        child: Row(children: [
                                          Text(
                                            '${property.property}: ',
                                            style:
                                                themeData.textTheme.bodySmall,
                                          ),
                                          Text(property.value),
                                        ]),
                                      );
                                    },
                                  ),
                                  SingleChildScrollView(
                                      physics: const ClampingScrollPhysics(),
                                      child: HtmlWidget(
                                          state.productDetail.data.discussion)),
                                  ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state
                                        .productDetail.data.comments.length,
                                    itemBuilder: (context, index) {
                                      final Comment comment = state
                                          .productDetail.data.comments[index];
                                      return Container(
                                        margin: const EdgeInsets.all(
                                            AppDimens.small),
                                        padding: const EdgeInsets.all(
                                            AppDimens.medium),
                                        decoration: BoxDecoration(
                                          color: AppColors.surfaceColor,
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.medium),
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                comment.user,
                                                style: themeData
                                                    .textTheme.bodySmall,
                                              ),
                                              Text(comment.body),
                                            ]),
                                      );
                                    },
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          throw Exception('invalid state');
        }
      },
    );
  }
}
