import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';

class TopSwimmers {
  List<TopSwimmer> topSwimmers;
  String title;

  TopSwimmers({required this.title, required this.topSwimmers});

  factory TopSwimmers.fromJson(Map<String, dynamic> json) {
    // List<TopSwimmer> tSwimmers = List.empty(growable: true);
    List<dynamic> jSwimmers = json['swimmers'];
    // jSwimmers.forEach((element) {
    //   TopSwimmer alphaSwimmer = TopSwimmer.fromJson(element);
    //   tSwimmers.add(alphaSwimmer);
    // });
    var topSwimmers = jSwimmers.map((m) => TopSwimmer.fromJson(m)).toList();
    return TopSwimmers(title: json['title'], topSwimmers: topSwimmers);
  }
}
