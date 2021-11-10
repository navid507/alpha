import 'package:alpha/back/periods/models/period.dart';
import 'package:alpha/back/periods/models/session.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

abstract class SessionsApiInterface
{
  Future<List<Session>> getAllSessions({required String periodID});

 }