import 'package:alpha/back/public_repo/models/alpha_club/alpha_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_club/alpha_club_model.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_club.dart';
import 'package:alpha/ui/first_page/widgets/get_top_swimmers.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlphaClubRoute extends StatefulWidget {
  const AlphaClubRoute({Key? key}) : super(key: key);

  @override
  _AlphaClubRouteState createState() => _AlphaClubRouteState();
}

class _AlphaClubRouteState extends State<AlphaClubRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAlphaClub();
    });
    super.initState();
  }

  AlphaClubModel get model =>
      Provider.of<AlphaClubModel>(context, listen: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.AlphaClub),
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).alphaClub));
  }

  getMainSectionView() {
    return Selector<AlphaClubModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.alphaClubState,
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
                return getAlphaClubView();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
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
              model.getAlphaClub();
            }));
  }

  getAlphaClubView() {
    List<Widget> alphaSwimmers =
        model.alphaClub!.alphaSwimmers.swimmers.map<Widget>((topSwimmer) {
      return getAlphaClubElement(swimmer: topSwimmer, rank: 0);
    }).toList();

    List<Widget> betaSwimmers =
        model.alphaClub!.betaSwimmers.swimmers.map<Widget>((topSwimmer) {
      return getAlphaClubElement(swimmer: topSwimmer, rank: 1);
    }).toList();

    List<Widget> omegaSwimmers =
        model.alphaClub!.omegaSwimmers.swimmers.map<Widget>((topSwimmer) {
      return getAlphaClubElement(swimmer: topSwimmer, rank: 2);
    }).toList();

    return ListView(scrollDirection: Axis.vertical, children: [
      Container(
        padding: EdgeInsets.only(bottom: 12),
        child: getAlphaTextHeaderYellow(model.alphaClub!.alphaSwimmers.title),
        alignment: Alignment.center,
        width: getScreenWidth(context),
      ),
      GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: alphaSwimmers,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 12, top: 24),
        child: getAlphaTextHeaderYellow(model.alphaClub!.betaSwimmers.title),
        alignment: Alignment.center,
        width: getScreenWidth(context),
      ),
      GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: betaSwimmers,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 12, top: 24),
        child: getAlphaTextHeaderYellow(model.alphaClub!.omegaSwimmers.title),
        alignment: Alignment.center,
        width: getScreenWidth(context),
      ),
      GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: omegaSwimmers,
      )
    ]);
  }

  getAlphaClubElement({required AlphaSwimmer swimmer, required int rank}) {
    var containerWidth = 200.0;
    var containerHeight = 170.0;
    var avatarTopPadding = 50.0;
    var rankString = (rank + 1).toString();
    var rankColor = AlphaColors.Yellow;
    late var avatar; // = getAvatarImageFirstTopSwimmer(swimmer.image);

    late var nameTextView;
    late var sessionTextView;
    var sessionText =
        "${getAppLocalization(context).presentsNumber}: ${swimmer.sessions}";
    late var back;
    switch (rank) {
      case 0:
        containerWidth = 130.0;
        containerHeight = 170.0;
        avatarTopPadding = 50.0;
        avatar = getAvatarImageAlphaClubSwimmer(swimmer.image);
        nameTextView = getAlphaTextSwimmer(swimmer.fullName);
        sessionTextView = getAlphaTextMoreYellow(sessionText);
        back = getBackTopSwimmer(size: 150, topPadding: avatarTopPadding);

        rankColor = AlphaColors.Yellow;
        break;
      case 1:
        containerWidth = 100.0;
        containerHeight = 130.0;
        avatarTopPadding = 40.0;
        avatar = getAvatarImageBetaClubSwimmer(swimmer.image);
        nameTextView = getAlphaTextSwimmer(swimmer.fullName);
        sessionTextView = getAlphaTextMoreYellow(sessionText);
        rankColor = AlphaColors.Silver;
        back = getBackTopSwimmer(size: 100, topPadding: avatarTopPadding);
        break;
      default:
        containerWidth = 100.0;
        containerHeight = 130.0;
        avatarTopPadding = 40.0;
        avatar = getAvatarImageOmegaSwimmer(swimmer.image);
        nameTextView = getOmegaTextSwimmer(swimmer.fullName);
        sessionTextView = getAlphaTextMoreYellow(sessionText);
        rankColor = AlphaColors.Bronze;
        back = getBackTopSwimmer(size: 70, topPadding: avatarTopPadding);

        break;
    }

    return GestureDetector(onTap: (){
      showPublicProfile(context, swimmer.id);
    },
      child: Container(
        child: Stack(
          children: [
            back,
            Column(
              children: [avatar!, nameTextView, sessionTextView],
            )
          ],
          alignment: Alignment.topCenter,
        ),
        height: containerHeight,
        width: containerWidth,
      ),
    );
  }
}
