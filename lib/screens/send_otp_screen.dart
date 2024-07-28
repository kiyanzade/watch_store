import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Assets.images.mainLogo.path,
          ),
          AppDimens.large.heightSizedBox,
          const TextField()
        ],
      ),
    );
  }
}
