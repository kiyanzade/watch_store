import 'package:flutter/material.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(
        title: const Text('نام محصول'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
