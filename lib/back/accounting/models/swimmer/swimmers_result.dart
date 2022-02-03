import 'package:freezed_annotation/freezed_annotation.dart';

import 'swimmer.dart';


part 'swimmers_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class SwimmersResult with _$SwimmersResult{
  const factory SwimmersResult.success(List<Swimmer> swimmers) = SuccessSwimmers;
  const factory SwimmersResult.error(int code, String msg) = ErrorSwimmers;
}

