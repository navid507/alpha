

import 'package:alpha/back/public_repo/models/gallery/image_item.dart';

class AlphaImageGallery
{
  List<AlphaImageItem> images;
  AlphaImageGallery({required this.images});

  factory AlphaImageGallery.fromJsonImages(List<dynamic> jsonImages)
  {
    List<AlphaImageItem> tImages = List.empty(growable: true);
    jsonImages.forEach((element) {
      AlphaImageItem imageItem = AlphaImageItem.fromJson(element);
      tImages.add(imageItem);
    });


    return AlphaImageGallery(images: tImages);
  }

}