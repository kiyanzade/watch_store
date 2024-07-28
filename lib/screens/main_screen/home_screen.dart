import 'package:flutter/material.dart';
import 'package:watch_store_app/widgets/app_slider_widget.dart';
import 'package:watch_store_app/widgets/search_bar_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarButton(onTap: () {}),
            const AppSliderWidget(),
          ],
        ),
      ),
    );
  }
}
