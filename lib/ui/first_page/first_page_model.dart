import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// abstract class GetSwimmerInterface extends ChangeNotifier {
//   Swimmer? activeSwimmer;
// }

class FirstPageModel extends ChangeNotifier {
  AccountingRepositoryInterface _accountingRepo = AccountingRepo.getInstance();

  PublicRepositoryInterface _publicRepo = PublicRepo.getInstance(
      PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));

  Swimmer? activeSwimmer;

  // Swimmer? get swimmer => _activeSwimmer;

  AlphaImageGallery? alphaImageGallery;

  // AlphaImageGallery? get alphaImageGallery => _alphaImageGallery;

  getActiveSwimmer() {
    _accountingRepo.activeSwimmerStream.listen((swimmer) {
      activeSwimmer = swimmer;
      notifyListeners();
    });
    _accountingRepo.updateActiveSwimmer();
  }

  getGallery() {
    _publicRepo.galleryStream.listen((curAlphaImageGallery) {
      alphaImageGallery = curAlphaImageGallery;
      notifyListeners();
    });
    _publicRepo.getGallery();

  }
}
