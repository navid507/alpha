import 'package:alpha/back/public_repo/models/AlphaTeams/team_member.dart';

import '../../../global_constants.dart';


class TeamInfo {
  // String id;
  String name;
  int rank;
  num score;
  // String createDate;
  List<TeamMember>? members;

  TeamInfo(
      { /*required this.id,*/
      required this.name,
      required this.rank,
      required this.score,
      // required this.createDate,
      required this.members});

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> jSwimmers = json['swimmers'];
    var members = jSwimmers.map((m) => TeamMember.fromJson(m)).toList();

    return TeamInfo(
        // id: json['id'],
        name: json['name'],
        // createDate: json['create_date'],
        score: json['score'],
        rank: json['rank'],
        members: members);
  }
}
