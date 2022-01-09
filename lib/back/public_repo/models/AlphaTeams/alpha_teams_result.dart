import 'package:alpha/back/public_repo/models/AlphaTeams/alpha_teams.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alpha_teams_result.freezed.dart';

@freezed
class AlphaTeamsResult with _$AlphaTeamsResult{
  const factory AlphaTeamsResult.success(AlphaTeams alphaTeam) = SuccessAlphaTeams;
  const factory AlphaTeamsResult.error(int code, String msg) = ErrorAlphaTeams;
}