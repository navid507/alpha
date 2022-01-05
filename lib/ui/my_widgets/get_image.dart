import 'package:flutter/material.dart';

getFitImageFromAsset(
    {required String image,
    required double width,
    required double height,
    required BoxFit fit}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: fit)),
  );
}

getFitImageFromNetwork(
    {required String image,
    required double width,
    required double height,
    required BoxFit fit}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: fit)),
  );
}
