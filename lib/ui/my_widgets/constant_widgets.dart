import 'package:flutter/cupertino.dart';

import 'constants.dart';

getHeader(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: Container(
        width: size.width,
        height: AlphaSizes.TopHeader,
        child: Stack(
          children: [],
        ),
      ));
}



getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}