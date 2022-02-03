

class TeamMember {
  String name;
  String image;
  num score;

  TeamMember({required this.name, required this.score, required this.image});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
        name: json['name'],
        image: json['image'],
        score: json['score']);
  }
}
