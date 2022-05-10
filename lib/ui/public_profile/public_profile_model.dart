import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer_result.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/period_result.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/back/periods/models/period/registered_period_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/public_profile/public_profile.dart';
import 'package:alpha/back/public_repo/models/public_profile/public_profile_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PublicProfileModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;

  LoadingState profileState = LoadingState.NotStarted;

  PublicProfile? activeSwimmer;

  String swimmerID;

  PublicProfileModel({required this.swimmerID}) {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getActiveSwimmer() {
    profileState = LoadingState.Loading;
    notifyListeners();

    _publicRepo
        .getPublicProfile(swimmerID: swimmerID)
        .asStream()
        .listen((swimmer) {
      profileState = LoadingState.Loaded;
      if (swimmer is SuccessPublicProfile) {
        activeSwimmer = swimmer.publicProfile;
        profileState = LoadingState.Loaded;

        notifyListeners();
      } else {
        profileState = LoadingState.LoadError;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _profileStateController.close();
    super.dispose();
  }
}
