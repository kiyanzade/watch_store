import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/product_item_widget.dart';

class ProductListScreen extends StatelessWidget {
  final String title;
  const ProductListScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(
        context: context,
        title: Text(title),
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductListEmptyState) {
            return const Center(
              child: Text('در حال حاضر محصولی وجود ندارد!'),
            );
          } else if (state is ProductListErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductListSuccessState) {
            return Column(
              children: [
                AppDimens.medium.heightSizedBox,
                const TagList(),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final ProductModel product = state.products[index];
                      return ProductWidget(
                        productModel: product,
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            throw Exception('invalid state');
          }
        },
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(AppDimens.large)),
                child: Text(
                  "نیوفورس",
                  style: themeData.textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              );
            }),
      ),
    );
  }
}
