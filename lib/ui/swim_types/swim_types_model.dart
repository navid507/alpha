import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwimTypesModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;

  List<RecordType>? allSwimTypes;
  LoadingState allSwimTypesState = LoadingState.NotStarted;

  SwimTypesModel() {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getAllSwimTypes() {
    allSwimTypesState = LoadingState.Loading;
    notifyListeners();

    _publicRepo.getAllSwimTypes().asStream().listen((curAllPeriodSessions) {
      if (curAllPeriodSessions is SuccessRecordTypes) {
        allSwimTypes = curAllPeriodSessions.recordTypes;
        allSwimTypesState = LoadingState.Loaded;
      } else {
        allSwimTypesState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
