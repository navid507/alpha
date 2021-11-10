import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:mockito/annotations.dart';



class MockDeviceInfo extends Mock
    implements DeviceInfoPlugin {
  // @override
  // // TODO: implement androidInfo
  // Future<AndroidDeviceInfo> get androidInfo async =>
  //     AndroidDeviceInfo(supported64BitAbis: [""], supportedAbis: [""], systemFeatures: [""], version: AndroidBuildVersion(), supported32BitAbis: [""]);
}

class MockUserStoredData extends Mock implements UserStoredData
{

  @override
  Future<UserStoredData> createUserStoredData({required DeviceInfoPlugin deviceInfo}) {
    // TODO: implement createUserStoredData
    throw UnimplementedError();
  }
}

void main() {
  late UserStoredData shr;
  var mockDeviceInfo = MockDeviceInfo();
  setUp(() async {
    shr = await UserStoredData.createUserStoredData(deviceInfo: mockDeviceInfo);
  });

  test('is share preference ok', () {
    expect(shr.setValue("test", 5), true);
  });

  test('is writing and reading ok', () {
    shr.setValue('test', 12);
    expect(shr.readValue('test'), equals(12));
  });

  test('is writing and reading String ok', () {
    var x = 'I am Navid';
    shr.setValue('test', x);
    expect(shr.readValue('test'), equals(x));
  });

  // test('is user name  ok', () {
  //   var un = 'navid';
  //   shr.setUsername(un);
  //   expect(shr.getUsername(), equals(un));
  // });
  //
  // test('is user pass  ok', () {
  //   var un = 'pass word';
  //   shr.setUserPass(un);
  //   expect(shr.getUserPass(), equals(un));
  // });

  // test('is device id  ok', () async {
  //   shr.reset();
  //
  //   when(mockDeviceInfo.androidInfo.).thenAnswer((realInvocation) async => AndroidDeviceInfo(version: AndroidBuildVersion._fromMap(), supported32BitAbis: [], supported64BitAbis: [], supportedAbis: [], systemFeatures: []));
  //
  //   var dID1 = await shr.getDeviceID();
  //   var dID2 = await shr.getDeviceID();
  //   print('$dID1: $dID2');
  //   expect(dID2, equals(dID1));
  // });

  test('is token ok', () {
    var un = 'device token';
    shr.setUserToken(un);
    expect(shr.getUserToken(), equals(un));
  });
}
