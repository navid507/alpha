enum SessionState {
  NotSpecified,
  Present,
  Absent,
}

class Session {
  String id;
  String date;
  String type;
  String score;
  String description;
  String swimmerScore;
  String swimmerDescription;

  SessionState get sessionState => SessionState.values[int.tryParse(type) ?? 0];

  Session(
      {required this.description,
      required this.id,
      required this.score,
      required this.date,
      required this.type,
      required this.swimmerScore,
      required this.swimmerDescription});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
        description: json['description'],
        id: json['id'],
        score: json['score'],
        date: json['date'],
        type: json['type'],
        swimmerDescription: json['swimmer_comment'],
        swimmerScore: json['swimmer_score']);
  }
}
