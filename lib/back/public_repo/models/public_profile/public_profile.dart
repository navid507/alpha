import 'package:alpha/back/public_repo/models/public_profile/best_record.dart';
import 'package:alpha/back/public_repo/models/public_profile/swimmer_title.dart';

import '../../../global_constants.dart';

class PublicProfile {
  static const assetsURL = mainUrl + "/assets/upload/";

  String name;
  int sessions;
  String dot;
  String image;
  String widthImage;
  int age;

  List<BestRecord> records;
  List<SwimmerTitle> titles;

  PublicProfile({
    required this.name,
    required this.sessions,
    required this.dot,
    required this.age,
    required this.image,
    required this.widthImage,
    required this.records,
    required this.titles,
  });

  factory PublicProfile.fromJson(Map<String, dynamic> json) {
    List<BestRecord> bestRecords = List.empty(growable: true);
    var jsonBestRecords = json['records'];
    jsonBestRecords.forEach((element) {
      BestRecord recordItem = BestRecord.fromJson(element);
      bestRecords.add(recordItem);
    });

    List<SwimmerTitle> swimmerTitles = List.empty(growable: true);
    var jsonSwimmerTitles = json['titles'];
    jsonSwimmerTitles.forEach((element) {
      SwimmerTitle swimmerTitlesItem = SwimmerTitle.fromJson(element);
      swimmerTitles.add(swimmerTitlesItem);
    });

    return PublicProfile(
        name: json['name'],
        sessions: json['sessions'],
        dot: json['dot'],
        age: json['age'],
        image:  assetsURL + json['thumb'],
        widthImage:  assetsURL + json['image'],
        records: bestRecords,
        titles: swimmerTitles);
  }
}
