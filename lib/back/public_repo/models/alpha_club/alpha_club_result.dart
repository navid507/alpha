import 'package:freezed_annotation/freezed_annotation.dart';

import 'alpha_club.dart';




part 'alpha_club_result.freezed.dart';

@freezed
class AlphaClubResult with _$AlphaClubResult{
  const factory AlphaClubResult.success(AlphaClub alphaClub) = SuccessAlphaClub;
  const factory AlphaClubResult.error(int code, String msg) = ErrorAlphaClub;
}