import 'dart:io';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/first_page_screen.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/splash/splash_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // This widget is the root of your application.
  var isAnimationEnd = false;
  var isCheckRegistrationEnd = false;
  var isFirebaseInitialized = false;

  SplashModel get model => Provider.of<SplashModel>(context, listen: false);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      AlphaSizes.isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

      model.initFirebase().asStream().listen((event) {
        final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
        isFirebaseInitialized = true;
        if (kIsWeb) {
          firebaseMessaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true,
          );
        } else {
        if (Platform.isIOS) {
          firebaseMessaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true,
          );
        }
        isFirebaseInitialized = true;

        if (mounted) navigateToMainScreen();
      }
      });

      model.registerStateStream.listen((registerState) {
        if (registerState != RegisterState.NotSetYet) {
          isCheckRegistrationEnd = true;
          if (mounted) navigateToMainScreen();
        }
      });

      model.checkPhoneRegisterState();

      //
      Future.delayed(Duration(seconds: 1), () {
        isAnimationEnd = true;
        navigateToMainScreen();
      });
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    // to hide both:
    // SystemChrome.setEnabledSystemUIOverlays([]);

    return ChangeNotifierProvider<SplashModel>(
      create: (context) => SplashModel(),
      child: Scaffold(
          // appBar: AppBar(title: Text('First Implementation of UI')),
          body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Stack(children: [
          Image(
              image: AssetImage('assets/images/splash_screen.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center),
          Visibility(
            visible: false,
            child: Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/jik.json',
                width: 200,
                height: 200,
                reverse: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              // getRefreshButton(context: context),
              getLoading(),
              getJustVersionTextInfo()
            ],
          )
        ]),
      )),
    );
  }

  navigateToMainScreen() {
    if (isAnimationEnd && isCheckRegistrationEnd && isFirebaseInitialized) {
      Future.delayed(
          Duration.zero,
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<FirstPageModel>(
                      create: (context) => FirstPageModel(),
                      child: FirstPage()))));
    }
  }

  getRefreshButton({required BuildContext context}) {
    return TextButton(
        onPressed: () {
          model.checkPhoneRegisterState();
        },
        child: Text('change name'));
  }

  getVersionTextInfo() {
    return Consumer<SplashModel>(
      builder: (context, splash, child) {
        return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5.0),
            child: Text('For ${splash.versionName}'));
      },
    );
  }

  getJustVersionTextInfo() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: Selector<SplashModel, String>(
          selector: (
            _,
            model,
          ) =>
              model.versionName,
          builder: (context, versionName, child) {
            return Text(' $versionName');
          },
        ));
  }

  getLoading() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
        strokeWidth: 2.0,
      ),
      height: 20,
      width: 20,
    );

    // _flush
  }
}
