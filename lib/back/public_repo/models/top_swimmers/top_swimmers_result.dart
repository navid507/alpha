import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';




part 'top_swimmers_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class TopSwimmersResult with _$TopSwimmersResult{
  const factory TopSwimmersResult.success(TopSwimmers topSwimmers) = SuccessTopSwimmers;
  const factory TopSwimmersResult.error(int code, String msg) = ErrorTopSwimmers;
}