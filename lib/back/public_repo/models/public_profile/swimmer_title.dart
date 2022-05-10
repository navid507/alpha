import '../../../global_constants.dart';

class SwimmerTitle {

  static const assetsURL = mainUrl + "/assets/upload/";

  String name;

  String desc;

  String rate;

  String image;

  SwimmerTitle(
      {required this.name,
      required this.desc,
      required this.rate,
      required this.image});

  factory SwimmerTitle.fromJson(Map<String, dynamic> json) {
    return SwimmerTitle(
        name: json['name'],
        desc: json['desc'],
        rate: json['rate'],
        image:  assetsURL + json['image']);
  }
}
