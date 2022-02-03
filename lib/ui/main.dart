import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/splash/splash_model.dart';
import 'package:alpha/ui/splash/splash_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class MainRepos {
//   static AccountingRepositoryInterface? accountingRepository;
// }

void main() {
  // UserStoredData.createUserStoredData(deviceInfo: DeviceInfoPlugin())
  //     .then((userStoredData) {
  //   MainRepos.accountingRepository =
  //       AccountingRepo.getInstance(userStoredData: userStoredData);
  // });
  // runApp(MaterialApp(title: 'Alpha', home: SplashScreen()),
  runApp(MaterialApp(
    title: 'Alpha',
    locale: Locale('fa', ''),
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [Locale('en', ''), Locale('fa', 'IR')],
    home: MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SplashModel()),
      ChangeNotifierProvider(create: (context) => FirstPageModel())
    ], child: SplashScreen()),
    theme: getAlphaThemeData(),
  ));
}
