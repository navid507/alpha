import '../../../global_constants.dart';

class AlphaSwimmer {
  static const assetsURL = mainUrl + "/assets/upload/";
  String fullName;
  String score;
  String sessions;
  String image;
  String id;

  AlphaSwimmer(
      {required this.score,
      required this.image,
      required this.fullName,
      required this.sessions,
      required this.id});

  factory AlphaSwimmer.fromJson(Map<String, dynamic> json) {
    return AlphaSwimmer(
        score: json['average'],
        image: assetsURL + json['image'],
        fullName: json['name'],
        sessions: json['present'],
        id: json['user_id']);
  }
}
