import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UserStoredData {
  SharedPreferences? _preferences;

  static const PREFERENCE_NAME = "userPreferences";

  static const USER_NAME = "userName";
  static const DEVICE_ID = "deviceId";
  static const USER_TOKEN = "userToken";
  static const USER_PASSWORD = "userPassword";

  static Future<UserStoredData> createUserStoredData() async {
    var myUSD = UserStoredData();
    myUSD._preferences = await SharedPreferences.getInstance();
    return myUSD;
  }

  bool setValue(String name, dynamic value) {
    if (_preferences != null) {
      switch (value.runtimeType) {
        case String:
          _preferences!.setString(name, value);
          return true;
        case int:
          _preferences!.setInt(name, value);
          return true;
        case bool:
          _preferences!.setBool(name, value);
          return true;
        case double:
          _preferences!.setDouble(name, value);
          return true;
      }
    }
    return false;
  }

  dynamic readValue(String name) {
    if (_preferences != null) {
      var val = _preferences!.get(name);
      return val;
    }
    return null;
  }

  setUsername(String username) {
    setValue(USER_NAME, username);
  }

  String getUsername() {
    return readValue(USER_NAME);
  }

  setUserPass(String password) {
    setValue(USER_PASSWORD, password);
  }

  String getUserPass() {
    return readValue(USER_PASSWORD);
  }

  setUserToken(String userToken) {
    setValue(USER_TOKEN, userToken);
  }

  String getUserToken() {
    return readValue(USER_TOKEN);
  }

  _setDeviceID(String deviceID) {
    setValue(DEVICE_ID, deviceID);
  }

  Future<String?> getDeviceID() async {
    var dID = readValue(DEVICE_ID);
    if (dID == null) {
      dID = await _findDeviceID();
      _setDeviceID(dID);
    }
    return dID;
  }

  Future<String?> _findDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.androidId;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   return iosInfo.identifierForVendor;
    // }
    // return null;
  }

  reset() {
    _preferences!.clear();
  }
}
