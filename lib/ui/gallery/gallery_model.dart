import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/periods/models/session/sessions_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;

  AlphaImageGallery? alphaImageGallery;
  LoadingState alphaImageGallerySessionsState = LoadingState.NotStarted;

  GalleryModel() {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getAllPeriodSessions() {
    alphaImageGallerySessionsState = LoadingState.Loading;
    notifyListeners();

    _publicRepo.getGallery().asStream().listen((curAllPeriodSessions) {
      if (curAllPeriodSessions is SuccessGallery) {
        alphaImageGallery = curAllPeriodSessions.gallery;
        alphaImageGallerySessionsState = LoadingState.Loaded;
      } else {
        alphaImageGallerySessionsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
