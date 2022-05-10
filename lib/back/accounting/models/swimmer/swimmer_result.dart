import 'package:freezed_annotation/freezed_annotation.dart';

import 'swimmer.dart';


part 'swimmer_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class SwimmerResult with _$SwimmerResult{
  const factory SwimmerResult.success(Swimmer swimmer) = SuccessSwimmer;
  const factory SwimmerResult.error(int code, String msg) = ErrorSwimmer;
}

