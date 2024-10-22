import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get heightSizedBox => SizedBox(
        height: toDouble(),
      );
  SizedBox get widthSizedBox => SizedBox(
        width: toDouble(),
      );
}
