

class TeamMember {
  String name;
  String image;
  num score;
  String id;

  TeamMember({required this.id, required this.name, required this.score, required this.image});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
        id: json['id'].toString(),
        name: json['name'],
        image: json['image'],
        score: json['score']);
  }
}
