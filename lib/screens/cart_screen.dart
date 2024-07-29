import 'package:flutter/material.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(AppStrings.basket),
      body: Column(children: [
        
      ],),
    );
  }
}
