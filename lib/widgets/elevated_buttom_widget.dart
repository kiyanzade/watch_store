import 'package:flutter/material.dart';

class ElevatedButtomWidget extends StatelessWidget {
  final Widget title;
  final Icon? icon;
  final Function() onPressed;
  const ElevatedButtomWidget({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
  
    return SizedBox(
      width: size.width * 0.75,
      height: size.height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title,
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
