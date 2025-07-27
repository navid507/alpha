import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

const mainUrl  = "https://www.alphaswim.ir";
// const mainUrl  = "http://www.orkaswim.ir";

// Future<String?> findDeviceUniqueID(DeviceInfoPlugin deviceInfo) async {
//
//   if (Platform.isAndroid) {
//     const _androidIdPlugin = AndroidId();
//     String? androidInfo = await _androidIdPlugin.getId();
//     return androidInfo;
//   }
//   else if (Platform.isIOS) {
//     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//     return iosInfo.identifierForVendor;
//   }
//
//   return null;
// }

Future<String?> findDeviceModel(DeviceInfoPlugin deviceInfo) async {

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

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return "${androidInfo.manufacturer}: ${androidInfo.model}";
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.utsname.machine;
  }
  return null;

}