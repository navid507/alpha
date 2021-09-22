
import 'package:alpha/ui/splash/splash_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays ([]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          // appBar: AppBar(title: Text('First Implementation of UI')),
          body: Column(
            children: [
              getVersionTextInfo(),
              getRefreshButton(context: context)
            ],
          )) /*MyBrothersName(title: 'Flutter Demo Home Page')*/,
    );
  }
}

getRefreshButton({required BuildContext context}) {
  return TextButton(
      onPressed: () {
        Provider.of<SplashModel>(context, listen: false).refreshVersion();
      },
      child: Text('change name'));
}


getVersionTextInfo() {
  return Consumer<SplashModel>(
    builder: (context, splash, child) {
      return Text('We found ${splash.versionName}');
    },
  );
}