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

  SessionState get sessionState {
    switch (int.tryParse(type)) {
      case -1:
        return SessionState.NotSpecified;
      case 0:
        return SessionState.Absent;
      default:
        return SessionState.Present;
    }
    return SessionState.Present;
  }

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
