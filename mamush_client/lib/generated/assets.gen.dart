/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsCfgGen {
  const $AssetsCfgGen();

  String get dev => 'assets/cfg/dev.json';
  String get prod => 'assets/cfg/prod.json';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get categoryBackground =>
      const AssetGenImage('assets/images/category_background.png');
  AssetGenImage get emptyStateFood =>
      const AssetGenImage('assets/images/empty_state_food.jpg');
  AssetGenImage get logoImage =>
      const AssetGenImage('assets/images/logo_image.png');
  AssetGenImage get noUser => const AssetGenImage('assets/images/no_user.png');
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');
}

class Assets {
  Assets._();

  static const $AssetsCfgGen cfg = $AssetsCfgGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
