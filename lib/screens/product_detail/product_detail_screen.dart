import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';

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
            body: Column(
              children: [
                Image.network(
                  state.productDetail.data.image,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
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
                          state.productDetail.data.title,
                          style: themeData.textTheme.titleLarge,
                        ),
                        AppDimens.small.heightSizedBox,
                        Text(
                          state.productDetail.data.description,
                          style: themeData.textTheme.titleMedium,
                        ),
                        const Divider(),
                        Expanded(
                          child: DefaultTabController(
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
                                Expanded(
                                  child: TabBarView(children: [
                                    SingleChildScrollView(
                                      child: Text(state
                                          .productDetail.data.properties
                                          .toString()),
                                    ),
                                    Text(state.productDetail.data.discussion),
                                    Text(
                                      state.productDetail.data
                                          .discussion, // TODO comment
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          throw Exception('invalid state');
        }
      },
    );
  }
}
