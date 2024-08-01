import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: customAppBarWidget(
        context: context,
        title: const Text('نام محصول'),
      ),
      body: Column(
        children: [
          Image.asset(
            Assets.images.unnamed.path,
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
                    "ساعت فلان",
                    style: themeData.textTheme.titleLarge,
                  ),
                  AppDimens.small.heightSizedBox,
                  Text(
                    "توضیحات ساعت",
                    style: themeData.textTheme.titleMedium,
                  ),
                  const Divider(),
                  const Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          TabBar(
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
                                child: Text(
                                  'خصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتخصوصیاتv',
                                ),
                              ),
                              Text(
                                'نقد و بررسی',
                              ),
                              Text(
                                'نظرات',
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
  }
}
