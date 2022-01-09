import 'package:alpha/back/public_repo/models/AlphaTeams/team_info.dart';

class AlphaTeams {
  List<TeamInfo> alphaTeams;

  AlphaTeams({required this.alphaTeams});

  factory AlphaTeams.fromJson(Map<String, dynamic> json) {
    List<dynamic> jSwimmers = json['teams'];
    var teams = jSwimmers.map((m) => TeamInfo.fromJson(m)).toList();

    return AlphaTeams(alphaTeams: teams);
  }

  List<TeamInfo> getRankedTeams() {
    alphaTeams.sort((r1, r2) => (r1.rank.compareTo(r2.rank)));
    return alphaTeams;
  }
}
