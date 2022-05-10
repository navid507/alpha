import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/public_profile/public_profile_model.dart';
import 'package:alpha/ui/public_profile/public_profile_route.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopSwimmersRoute extends StatefulWidget {
  const TopSwimmersRoute({Key? key}) : super(key: key);

  @override
  _TopSwimmersRouteState createState() => _TopSwimmersRouteState();
}

class _TopSwimmersRouteState extends State<TopSwimmersRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getTopSwimmers();
    });
    super.initState();
  }

  TopSwimmersModel get model =>
      Provider.of<TopSwimmersModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
        drawer: getDrawerWithProvider(),
        body: Builder(builder: (drawerContext) {
          return getScreenBody(drawerContext);
        }));
  }

  getDrawerWithProvider() {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) {
        return DrawerModel();
      },
      child: AlphaDrawerWidget(page: AlphaRoutes.TopSwimmers),
    );
  }

  getScreenBody(BuildContext screenBodyContext) {
    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        getTitle(),
        Expanded(child: getMainSectionView())
      ])
    ]);
  }

  getTitle() {
    return Selector<TopSwimmersModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.topSwimmersState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
            case LoadingState.LoadError:
              {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: getAlphaPageTitleWhite(""));
              }
            case LoadingState.Loaded:
              {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child:
                        getAlphaPageTitleWhite(model.alphaTopSwimmers!.title));
              }
          }
        });
  }

  getMainSectionView() {
    return Selector<TopSwimmersModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.topSwimmersState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                // return getLoadingView();
                return getTopSwimmersListView();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getTopSwimmersListView() {
    List<Widget> all =
        model.alphaTopSwimmers!.topSwimmers.map<Widget>((topSwimmer) {
      return getTopSwimmerView(topSwimmer);
    }).toList();
    // all.insert(
    //     0,
    //     Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
    //         child: getAlphaPageTitleWhite(model.alphaTopSwimmers!.title)));
    return ListView(
      scrollDirection: Axis.vertical,
      children: all,
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
      height: 20,
      width: 40,
    );
  }

  getRetryButton() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              model.getTopSwimmers();
            }));
  }

  getTopSwimmerView(TopSwimmer topSwimmer) {
    return GestureDetector(
      onTap: () {
        showPublicProfile(topSwimmer.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: AlphaColors.backDialog,
                borderRadius: BorderRadius.circular(12)),
            width: getScreenWidth(context),
            height: 140,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  getAvatarImageAlphaClub(topSwimmer.image),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getAlphaTextTitle1White(topSwimmer.name),
                        getAlphaTextMoreYellow(
                            " ${getAppLocalization(context).score}: ${topSwimmer.score}"),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getAlphaSecondaryTitle(
                                      getAppLocalization(context)
                                          .practiseSessionNumber),
                                  getAlphaSecondaryValue(topSwimmer.present),
                                  getAlphaSecondaryTitle(
                                      getAppLocalization(context)
                                          .absentsSessionNumber),
                                  getAlphaSecondaryValue(topSwimmer.absent)
                                ],
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getAlphaSecondaryTitle(
                                      getAppLocalization(context).teamName),
                                  getAlphaSecondaryValue(
                                      topSwimmer.teamName ?? "")
                                ],
                              ),
                            )),
                          ],
                        ))
                      ],
                    ),
                  ))
                ],
              ),
            )),
      ),
    );
  }

  showPublicProfile(String swimmerID) {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChangeNotifierProvider<PublicProfileModel>(
                        create: (context) =>
                            PublicProfileModel(swimmerID: swimmerID),
                        child: PublicProfileRoute()))));
  }
}
