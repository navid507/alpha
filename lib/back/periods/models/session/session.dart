class Session {
  String id;
  String date;
  String type;
  String score;
  String description;

  Session(
      {required this.description,
      required this.id,
      required this.score,
      required this.date,
      required this.type});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        description: json['description'],
        id: json['id'],
        score: json['score'],
        date: json['date'],
        type: json['type']);
  }

  
}
