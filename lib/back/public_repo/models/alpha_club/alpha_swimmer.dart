import '../../../global_constants.dart';

class AlphaSwimmer {
  static const assetsURL = mainUrl + "/assets/upload/";
  String fullName;
  String score;
  String sessions;
  String image;

  AlphaSwimmer(
      {required this.score,
      required this.image,
      required this.fullName,
      required this.sessions});

  factory AlphaSwimmer.fromJson(Map<String, dynamic> json) {
    return AlphaSwimmer(
        score: json['average'],
        image: assetsURL + json['image'],
        fullName: json['name'],
        sessions: json['present']);
  }
}
