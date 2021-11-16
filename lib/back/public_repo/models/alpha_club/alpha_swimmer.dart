class AlphaSwimmer{
  String fullName;
  String score;
  String sessions;
  String image;

  AlphaSwimmer({required this.score, required this.image, required this.fullName, required this.sessions});
  factory AlphaSwimmer.fromJson(Map<String, dynamic> json)
  {
    return AlphaSwimmer(score: json['average'], image: json['image'], fullName: json['name'], sessions: json['present']);
  }
}