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


getLogoImage() {
  return Image(
    image: AssetImage('assets/images/alpha_top_logo.png'),
  );
}

getEmptyIcon() {
  return SizedBox(height: 48, width: 48);
}

getMenuIcon({void Function()? onPressed, required String imageAsset}) {
  return SizedBox(
    height: 48,
    width: 48,
    child: TextButton(
      child: Image(image: AssetImage(imageAsset)),
      onPressed: onPressed,
    ),
  );
}
