
class ImageItem
{

  String id;
  String title;
  String content;
  String link;
  String image;

  ImageItem({required this.id, required this.title, required this.content, required this.link, required this.image});

  factory ImageItem.fromJson(Map<String, dynamic> json)
  {
    return ImageItem(id: json['id'], title:json['title'] , content: json['content'], link: json['link'], image: json['image']);
  }

}