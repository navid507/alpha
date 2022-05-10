import 'package:alpha/back/global_constants.dart';

class AlphaImageItem {
  static const assetsURL = mainUrl + "/assets/upload/";

  String id;
  String title;
  String content;
  String link;
  String image;

  AlphaImageItem(
      {required this.id,
      required this.title,
      required this.content,
      required this.link,
      required this.image});

  factory AlphaImageItem.fromJson(Map<String, dynamic> json) {
    return AlphaImageItem(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        link: json['link'],
        image: assetsURL + json['image']);
  }
}
