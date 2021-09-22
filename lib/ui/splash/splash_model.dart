import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashModel extends ChangeNotifier {
  late PackageInfo _packageInfo;

  SplashModel() {
    getVersionInfo();
  }

  getVersionInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }

  String get versionName => 'version: ${_packageInfo.version}';

  void refreshVersion() {
    getVersionInfo();
  }
}
