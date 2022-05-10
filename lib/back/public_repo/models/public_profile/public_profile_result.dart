import 'package:alpha/back/public_repo/models/public_profile/public_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_profile_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class PublicProfileResult with _$PublicProfileResult {
  const factory PublicProfileResult.success(PublicProfile publicProfile) =
      SuccessPublicProfile;

  const factory PublicProfileResult.error(int code, String msg) =
      ErrorPublicProfile;
}
