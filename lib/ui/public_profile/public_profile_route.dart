import 'package:alpha/back/public_repo/models/public_profile/best_record.dart';
import 'package:alpha/back/public_repo/models/public_profile/public_profile.dart';
import 'package:alpha/back/public_repo/models/public_profile/swimmer_title.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/public_profile/public_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_widgets/user_image.dart';

enum ProfileRouteState { Records, Titles }

class PublicProfileRoute extends StatefulWidget {
  const PublicProfileRoute({Key? key}) : super(key: key);

  @override
  _PublicProfileRouteState createState() => _PublicProfileRouteState();
}

class _PublicProfileRouteState extends State<PublicProfileRoute> {
  late AlphaHeader alphaHeader;
  ProfileRouteState profileRouteState = ProfileRouteState.Records;

  AppLocalizations get appLocale => getAppLocalization(context);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getActiveSwimmer();
    });
    super.initState();
  }

  PublicProfileModel get model =>
      Provider.of<PublicProfileModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
        drawer: getDrawerWithProvider(),
        body: Builder(builder: (context) {
          return getMainSectionView(context);
        }));
  }

  getDrawerWithProvider() {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) {
        return DrawerModel();
      },
      child: AlphaDrawerWidget(page: AlphaRoutes.PublicProfile),
    );
  }

  getTitle() {
    return Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).userProfile));
  }

  getMainSectionView(BuildContext buildContext) {
    return Selector<PublicProfileModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.profileState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                PublicProfile profile = model.activeSwimmer!;
                return getProfileView(profile, buildContext);
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getSplitterLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerRight,
        height: 15,
        width: 1,
        color: AlphaColors.White,
      ),
    );
  }

  getHorizontalLine() {
    return Container(
      color: AlphaColors.White.withAlpha(30),
      width: getScreenWidth(context),
      height: 1,
    );
  }

  getPeriodButton(
      {required String title,
      required String icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
              color: AlphaColors.TextGray,
              borderRadius: BorderRadius.circular(8.0),
              border: Border()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 30,
                ),
                getAlphaTextBodyWhite(title)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getProfileView(PublicProfile profile, BuildContext buildContext) {
    var screenHeight = getScreenHeight(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    color: AlphaColors.backDialog,
                    child: getImageOfProfile(profile.widthImage),
                    width: getScreenWidth(context),
                    height: screenHeight / 2.3,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: getAvatarImageProfile(profile.image)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: getAlphaTextHeaderWhite(profile.name)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  getAlphaTextBodyWhite(appLocale.age),
                                  Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: getAlphaTextTitle1Yellow(
                                          "${profile.age.toString()} ${appLocale.year}")),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          child:
                              getAlphaTextSessionNumber("${profile.sessions}"),
                        ),
                        getAlphaTextSessionNumberLabel(appLocale.sessionsNumber)
                      ],
                    ),
                  )
                ],
              ),
            ),
            getTabsContents()
          ],
        ),
        alphaHeader.getTopMenu(buildContext),
      ],
    );
  }

  getTabsContents() {
    return Expanded(
      child: Column(
        children: [getTabs(), getContents()],
      ),
    );
  }

  getTabs() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            if (profileRouteState != ProfileRouteState.Records) {
              setState(() {
                profileRouteState = ProfileRouteState.Records;
              });
            }
          },
          child: Container(
              alignment: Alignment.center,
              child: (profileRouteState == ProfileRouteState.Records)
                  ? getAlphaTextHeaderYellow(appLocale.swimmerRecords)
                  : getAlphaTextHeaderWhite(appLocale.swimmerRecords)),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            if (profileRouteState != ProfileRouteState.Titles) {
              setState(() {
                profileRouteState = ProfileRouteState.Titles;
              });
            }
          },
          child: Container(
              alignment: Alignment.center,
              child: (profileRouteState == ProfileRouteState.Titles)
                  ? getAlphaTextHeaderYellow(appLocale.swimmerTitles)
                  : getAlphaTextHeaderWhite(appLocale.swimmerTitles)),
        ))
      ]),
    );
  }

  getContents() {
    return (profileRouteState == ProfileRouteState.Records)
        ? getRecordsListView()
        : getTitlesListView();
  }

  getRecordsListView() {
    List<Widget> all = model.activeSwimmer!.records.map<Widget>((record) {
      return getRecordView(record);
    }).toList();

    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: all,
      ),
    );
  }

  getRecordView(BestRecord record) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AlphaColors.backDialog),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                color: AlphaColors.White,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Column(
                  children: [
                    getAlphaTextBodyWhite(record.styleName),
                    getAlphaTextHeaderYellow(record.time.toString())
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                child: Column(
                  children: [
                    getAlphaTextBodyWhite(appLocale.ages),
                    getAlphaTextBodyYellow(record.age)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getTitlesListView() {
    List<Widget> all = model.activeSwimmer!.titles.map<Widget>((title) {
      return getTitleView(title);
    }).toList();

    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: all,
      ),
    );
  }

  getTitleView(SwimmerTitle title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AlphaColors.backDialog),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        title.image,
                        width: 58,
                        height: 58,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Column(
                          children: [
                            getAlphaTextBodyWhite(title.name),
                            Row(
                              children: [
                                getAlphaTextBodyGrayLight(
                                    appLocale.acquiredTitle),
                                getAlphaTextBodyYellow(title.rate)
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: getAlphaTextBodyWhite(title.desc),
                )
              ],
            )),
      ),
    );
  }

  getImageOfProfile(String image) {
    return Stack(
      children: [
        Opacity(
            opacity: 0.8,
            child: Container(
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                image: image,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                placeholder: 'assets/images/header_swimmer.png',
              ),
            )),
        Container(
          decoration: BoxDecoration(gradient: AlphaColors.PublicImageGradient),
        )
      ],
    );
  }

  getLoadingView() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
        strokeWidth: 2.0,
      ),
      height: double.infinity,
      width: double.infinity,
    );
  }

  getRetryButton() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              model.getActiveSwimmer();
            }));
  }
}
