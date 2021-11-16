

import 'package:alpha/back/public_repo/models/gallery/image_item.dart';

class Gallery
{
  List<ImageItem> images;
  Gallery({required this.images});

  factory Gallery.fromJsonImages(List<dynamic> jsonImages)
  {
    List<ImageItem> tImages = List.empty(growable: true);
    jsonImages.forEach((element) {
      ImageItem imageItem = ImageItem.fromJson(element);
      tImages.add(imageItem);
    });


    return Gallery(images: tImages);
  }

}