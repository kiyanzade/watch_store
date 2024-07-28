/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatarPng =>
      const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/avatar.svg
  String get avatarSvg => 'assets/images/avatar.svg';

  /// File path: assets/images/back.svg
  String get back => 'assets/images/back.svg';

  /// File path: assets/images/cancelled.svg
  String get cancelled => 'assets/images/cancelled.svg';

  /// File path: assets/images/cart.svg
  String get cart => 'assets/images/cart.svg';

  /// File path: assets/images/clasic.svg
  String get clasic => 'assets/images/clasic.svg';

  /// File path: assets/images/close.svg
  String get close => 'assets/images/close.svg';

  /// File path: assets/images/delete.svg
  String get delete => 'assets/images/delete.svg';

  /// File path: assets/images/delivered.svg
  String get delivered => 'assets/images/delivered.svg';

  /// File path: assets/images/desktop.svg
  String get desktop => 'assets/images/desktop.svg';

  /// File path: assets/images/digital.svg
  String get digital => 'assets/images/digital.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/in_proccess.svg
  String get inProccess => 'assets/images/in_proccess.svg';

  /// File path: assets/images/left_arrow.svg
  String get leftArrow => 'assets/images/left_arrow.svg';

  /// File path: assets/images/location.svg
  String get location => 'assets/images/location.svg';

  /// File path: assets/images/main_logo.png
  AssetGenImage get mainLogo =>
      const AssetGenImage('assets/images/main_logo.png');

  /// File path: assets/images/minus.svg
  String get minus => 'assets/images/minus.svg';

  /// File path: assets/images/phone.svg
  String get phone => 'assets/images/phone.svg';

  /// File path: assets/images/plus.svg
  String get plus => 'assets/images/plus.svg';

  /// File path: assets/images/postal_code.svg
  String get postalCode => 'assets/images/postal_code.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/smart.svg
  String get smart => 'assets/images/smart.svg';

  /// File path: assets/images/sort.svg
  String get sort => 'assets/images/sort.svg';

  /// File path: assets/images/unnamed.png
  AssetGenImage get unnamed => const AssetGenImage('assets/images/unnamed.png');

  /// File path: assets/images/user.svg
  String get user => 'assets/images/user.svg';

  /// File path: assets/images/user_menu.svg
  String get userMenu => 'assets/images/user_menu.svg';

  /// List of all assets
  List<dynamic> get values => [
        avatarPng,
        avatarSvg,
        back,
        cancelled,
        cart,
        clasic,
        close,
        delete,
        delivered,
        desktop,
        digital,
        home,
        inProccess,
        leftArrow,
        location,
        mainLogo,
        minus,
        phone,
        plus,
        postalCode,
        search,
        smart,
        sort,
        unnamed,
        user,
        userMenu
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
