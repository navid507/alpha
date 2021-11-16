import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'session.dart';
part 'sessions_result.freezed.dart';

@freezed
class SessionsResult with _$SessionsResult{
  const factory SessionsResult.success(List<Session> sessions) = SuccessSessions;
  const factory SessionsResult.error(int code, String msg) = ErrorSessions;
}