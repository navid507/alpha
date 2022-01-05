
class AlphaImageItem
{

  String id;
  String title;
  String content;
  String link;
  String image;

  AlphaImageItem({required this.id, required this.title, required this.content, required this.link, required this.image});

  factory AlphaImageItem.fromJson(Map<String, dynamic> json)
  {
    return AlphaImageItem(id: json['id'], title:json['title'] , content: json['content'], link: json['link'], image: json['image']);
  }

}