import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/splash/splash_model.dart';
import 'package:alpha/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MaterialApp(title: 'Alpha', home: SplashScreen()),
  runApp(MaterialApp(
    title: 'Alpha',
    home: Directionality(
        textDirection: TextDirection.rtl,
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => SplashModel()),
          ChangeNotifierProvider(create: (context) => FirstPageModel())
        ], child: SplashScreen())),
    theme: ThemeData(
      scaffoldBackgroundColor: AlphaColors.background,
    ),
  ));
}
