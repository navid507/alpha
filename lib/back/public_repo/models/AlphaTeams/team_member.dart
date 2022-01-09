import '../../../global_constants.dart';


class TeamMember {
  static const assetsURL = mainUrl + "/assets/upload/";
  String name;
  String image;
  num score;

  TeamMember({required this.name, required this.score, required this.image});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
        name: json['name'],
        image: assetsURL + json['image'],
        score: json['score']);
  }
}
