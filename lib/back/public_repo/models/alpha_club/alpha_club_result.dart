import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'alpha_club.dart';




part 'alpha_club_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class AlphaClubResult with _$AlphaClubResult{
  const factory AlphaClubResult.success(AlphaClub alphaClub) = SuccessAlphaClub;
  const factory AlphaClubResult.error(int code, String msg) = ErrorAlphaClub;
}