import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../my_widgets/alpha_text.dart';
import '../../my_widgets/constants.dart';
import '../../my_widgets/get_image.dart';

getSlider(AlphaImageGallery alphaImageGallery, double width) {
  return CarouselSlider(
      items: alphaImageGallery.images.map((alphaImageItem) {
        return Builder(builder: (BuildContext cContext) {
          return getImageSlide(alphaImageItem, width);
        });
      }).toList(),
      options: CarouselOptions(height: 200.0, enlargeCenterPage: true));
}



//
// getImageSlideLocal(AlphaImageItem alphaImageItem, double width) {
//   return Stack(children: [
//     ClipRRect(
//         borderRadius: BorderRadius.circular(12.0),
//         child: Container(
//           child: getImageForSlider(
//               image:
//               'assets/images/splash_screen.png' /*alphaImageItem.image*/,
//               width: width,
//               height: 200),
//           decoration:
//           BoxDecoration(gradient: AlphaColors.ImageGalleyGradient),
//         )),
//     // Image.network(alphaImageItem.image),
//     Align(
//       child: Container(
//         child: getAlphaTextTitle1White(alphaImageItem.title),
//         padding: const EdgeInsets.all(8),
//       ),
//       alignment: Alignment.bottomRight,
//     )
//     // Text(alphaImageItem.content)
//   ]);
// }


getImageSlide(AlphaImageItem alphaImageItem, double width) {
  return Stack(children: [
    ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          child: getImageForSlider(
              image:
              /*'assets/images/splash_screen.png' */alphaImageItem.image,
              width: width,
              height: 200),
          decoration:
          BoxDecoration(gradient: AlphaColors.ImageGalleyGradient),
        )),
    // Image.network(alphaImageItem.image),
    Align(
      child: Container(
        child: getAlphaTextTitle1White(alphaImageItem.title),
        padding: const EdgeInsets.all(8),
      ),
      alignment: Alignment.bottomRight,
    )
    // Text(alphaImageItem.content)
  ]);
}

getImageForSlider(
    {required String image, required double width, required double height}) {
  return Stack(
    children: [
      getFitImageFromNetwork(
          image: image, width: width, height: height, fit: BoxFit.fill),
      Opacity(opacity: 0.5, child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(gradient: AlphaColors.ImageGalleyGradient),
      ))
    ],
  );
}