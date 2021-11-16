class TopSwimmers{
  List<TopSwimmer>? topSwimmers;
  String title;

  TopSwimmers({required this.title, required this.topSwimmers});

  factory TopSwimmers.fromJson(Map<String, dynamic> json)
  {
    List<TopSwimmer> tSwimmers = List.empty(growable: true);
    List<dynamic> jSwimmers = json['swimmers'];
    jSwimmers.forEach((element) {
      TopSwimmer alphaSwimmer = TopSwimmer.fromJson(element);
      tSwimmers.add(alphaSwimmer);
    });
    return TopSwimmers(title: json['title'], topSwimmers: tSwimmers);
  }
}

class TopSwimmer {




  String name;
  String image;
  String total;
  String present;
  String absent;
  String score;

  TopSwimmer(
      {required this.name,
      required this.image,
      required this.absent,
      required this.present,
      required this.score,
      required this.total});

  factory TopSwimmer.fromJson(Map<String, dynamic> json) {
    return TopSwimmer(
        name: json['name'],
        image: json['image'],
        absent: json['absent'],
        present: json['present'],
        score: json['average'],
        total: json['num']);
  }
}
