
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

import 'package:uuid/uuid.dart';

import '../global_constants.dart';

class UserStoredData {
  // hide the constructor:
  // UserStoredData._();

  // SharedPreferences? _preferences;
  late DeviceInfoPlugin deviceInfo; // = DeviceInfoPlugin();

  static const PREFERENCE_NAME = "userPreferences";

  static const REGISTER_STATE = "registerState";

  // static const USER_NAME = "userName";
  static const DEVICE_ID = "deviceId";
  static const UNIQUE_ID = "uniqueId";
  static const DEVICE_NAME= "device_name";
  static const USER_TOKEN = "userToken";
  static const ACTIVE_USER = "activeUser";

  // static const USER_PASSWORD = "userPassword";

  // static Future<UserStoredData> createUserStoredData(
  //     {required DeviceInfoPlugin deviceInfo}) async {
  //   var myUSD = UserStoredData._();
  //   // myUSD._preferences = await SharedPreferences.getInstance();
  //   myUSD._deviceInfo = deviceInfo;
  //   return myUSD;
  // }

  UserStoredData({required this.deviceInfo});

  Future<bool> setValue(String name, dynamic value) async {
    var _preferences = await SharedPreferences.getInstance();
    var done = false;
    switch (value.runtimeType) {
      case String:
        _preferences.setString(name, value);
        done = true;
        break;
      case int:
        _preferences.setInt(name, value);
        done = true;
        break;
      case bool:
        _preferences.setBool(name, value);
        done = true;
        break;
      case double:
        _preferences.setDouble(name, value);
        done = true;
        break;
      default:
        done = false;
    }
    // _preferences.clear();
    return done;
  }

  Future<T> readValue<T>(String name) async {
    var _preferences = await SharedPreferences.getInstance();
    var val = _preferences.get(name) as T;
    // _preferences.clear();
    return val;
  }

  setRegisterState(RegisterState registerState) {
    setValue(REGISTER_STATE, registerState.index);
  }

  Future<RegisterState> getRegisterState() async {
    var state = await readValue<int?>(REGISTER_STATE);
    return RegisterState.values[state ?? 0];
  }

  setActiveUser(int userID) {
    setValue(ACTIVE_USER, userID);
  }

  Future<int?> getActiveUser() async {
    return readValue<int?>(ACTIVE_USER);
  }

// setUsername(String username) {
//   setValue(USER_NAME, username);
// }
//
// String getUsername() {
//   return readValue<String?>(USER_NAME) ?? "";
// }
//
// setUserPass(String password) {
//   setValue(USER_PASSWORD, password);
// }
//
// String getUserPass() {
//   return readValue<String?>(USER_PASSWORD) ?? "";
// }

  setDeviceID(String deviceID) {
    setValue(DEVICE_ID, deviceID);
  }

  Future<String?> getDeviceID() async {
    return readValue<String?>(DEVICE_ID);
  }

  setUserToken(String userToken) {
    setValue(USER_TOKEN, userToken);
  }

  Future<String?> getUserToken() async {
    return readValue<String?>(USER_TOKEN);
  }

  _setDeviceUniqueID(String deviceID) {
    setValue(UNIQUE_ID, deviceID);
  }

  String? getUidFromLocalStorage() {
    return html.window.localStorage['unique_id'];
  }

  void saveUidToLocalStorage(String uid) {
    html.window.localStorage['unique_id'] = uid;
  }

  // Future<String> getDeviceUniqueID() async {
  //   var uID = await readValue<String?>(UNIQUE_ID);
  //   if (uID == null) {
  //     uID = findDeviceUniqueID();
  //     _setDeviceUniqueID(uID);
  //   }
  //   return uID;
  // }


  Future<String> getDeviceUniqueID() async {
    if (kIsWeb) {
      try {
        var uid = html.window.localStorage['unique_id'];
        if (uid == null) {
          uid = Uuid().v4(); // یا v1
          html.window.localStorage['unique_id'] = uid;
        }
        return uid;
      } catch (e) {
        print('LocalStorage error: $e');
        return Uuid().v4(); // fallback
      }
    }

    // برای Android / iOS
    var uID = await readValue<String?>(UNIQUE_ID);
    if (uID == null) {
      uID = findDeviceUniqueID();
      _setDeviceUniqueID(uID);
    }
    return uID;
  }

  Future<String?> getDeviceName() async {
    var name = await readValue<String?>(DEVICE_NAME);
    if (name == null) {
      name = await findDeviceName(deviceInfo);
      if (name != null) {
        setValue(DEVICE_NAME, name);
      }
    }
    return name;
  }

  String findDeviceUniqueID() {
    var uuid = Uuid();
    return uuid.v1();

  }

// reset() {
//   _preferences!.clear();
// }
}