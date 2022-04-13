import '../../../global_constants.dart';

class TopSwimmer {
  static const assetsURL = mainUrl + "/assets/upload/";
  String id;
  String name;
  String image;
  String total;
  String present;
  String absent;
  String score;
  String? teamName;

  TopSwimmer(
      {required this.id,
      required this.name,
      required this.image,
      required this.absent,
      required this.present,
      required this.score,
      required this.total,
      this.teamName});

  factory TopSwimmer.fromJson(Map<String, dynamic> json) {
    return TopSwimmer(
        id: json['swimmer_id'],
        name: json['name'],
        image: assetsURL + json['image'],
        absent: json['absent'],
        present: json['present'],
        score: json['average'],
        teamName: json['team_name'],
        total: json['num']);
  }
}
