import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/foundation.dart' as Foundation;

const mainUrl  = "https://www.alphaswim.ir";
// const mainUrl  = "http://www.orkaswim.ir";

Future<String?> findDeviceUniqueID(DeviceInfoPlugin deviceInfo) async {
  if (kIsWeb) {
    String deviceIdentifier = "unknown";
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return   deviceIdentifier = webInfo.userAgent!;
  }
  if (Platform.isAndroid) {
    const _androidIdPlugin = AndroidId();
    String? androidInfo = await _androidIdPlugin.getId();
    return androidInfo;
  }
  else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  }

  return null;
}

Future<String?> findDeviceModel(DeviceInfoPlugin deviceInfo) async {
  if (kIsWeb) {
    String deviceIdentifier = "unknown";
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return   deviceIdentifier = webInfo.appVersion!;
  }
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return "${androidInfo.version}";
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.utsname.version;
  }
  return null;
}

Future<String?> findDeviceName(DeviceInfoPlugin deviceInfo) async {
  if (kIsWeb) {
    String deviceIdentifier = "unknown";
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return   deviceIdentifier = webInfo.browserName.toString()!;
  }
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return "${androidInfo.manufacturer}: ${androidInfo.model}";
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.utsname.machine;
  }
  return null;

}