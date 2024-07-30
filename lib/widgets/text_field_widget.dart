import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/res/dimens.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? prefixWidget;
  final TextAlign textAlign;
  final Icon? icon;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    this.icon,
    required this.controller,
    this.keyboardType,
    this.prefixWidget,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: themeData.textTheme.titleMedium,
              ),
              prefixWidget ?? const SizedBox.shrink(),
            ],
          ),
          AppDimens.medium.heightSizedBox,
          SizedBox(
            height: size.height * 0.07,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              textAlign: textAlign,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
