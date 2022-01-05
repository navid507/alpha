import 'package:flutter/material.dart';

class AlphaColors {
  static const Yellow = Color(0xFFFDD537);
  static const Red = Color(0xFFFD4D30);
  static const Green = Color(0xFF38D37A);
  static const White = Color(0xFFFFFFFF);
  static const Silver = Color(0xFFC6C7CE);
  static const Gold = Color(0xFFFDD537);
  static const Bronze = Color(0xFFFC893A);
  static const BackDark = Color(0xFF353535);
  static const Transparent = Colors.transparent;

  static const background = Color(0xFF353535);

  // static const nnn = Color(0xyyy);
  // static const nnn = Color(0xyyy);
  // static const nnn = Color(0xyyy);
  // static const nnn = Color(0xyyy);

  // Top Swimmers Gradient
  static const _TopSwimmerGradientTop = Colors.white;
  static const _TopSwimmerGradientBottom = Color(0xFF888888);
  static const TopSwimmerGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [_TopSwimmerGradientTop, _TopSwimmerGradientBottom]);

  // First Page Gallery Gradient
  static const _GalleryGradientTop = Color(0xFFFFFFFF);
  static const _GalleryGradientBottom = Color(0x888888);
  static const GalleyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [_GalleryGradientTop, _GalleryGradientBottom]);

  static const _ImageGalleryGradientTop = Color(0x00201943);
  static const _ImageGalleryGradientBottom = Color(0xFF0D0A1E);
  static const ImageGalleyGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [_ImageGalleryGradientTop, _ImageGalleryGradientBottom]);

}

class AlphaSizes {
  static const TopHeader = 70.0;
  static const TopHeaderBar = 30.0;
  static const NotchHeight = 32.0;

  static late bool isNeedSafeArea;

  static double getTopPadding({double constValue = 0}) {
    return AlphaSizes.isNeedSafeArea ? NotchHeight + constValue : constValue;
  }
}
