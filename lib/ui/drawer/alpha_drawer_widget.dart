import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/about_us/about_us_route.dart';
import 'package:alpha/ui/alpha_club/alpha_club_model.dart';
import 'package:alpha/ui/alpha_club/alpha_club_route.dart';
import 'package:alpha/ui/alpha_team_details/alpha_teams_model.dart';
import 'package:alpha/ui/alpha_team_details/alpha_teams_route.dart';
import 'package:alpha/ui/change_user_dialog/change_user_dialog.dart';
import 'package:alpha/ui/change_user_dialog/change_user_model.dart';
import 'package:alpha/ui/contact_us/contact_us_route.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/first_page_screen.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/periods/period_route.dart';
import 'package:alpha/ui/periods/periods_model.dart';
import 'package:alpha/ui/profile/profile_model.dart';
import 'package:alpha/ui/profile/profile_route.dart';
import 'package:alpha/ui/register_phone/register_phone_dialog.dart';
import 'package:alpha/ui/register_phone/register_phone_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_route.dart';
import 'package:alpha/ui/verify_phone/verify_phone_dialog.dart';
import 'package:alpha/ui/verify_phone/verify_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AlphaDrawerWidget extends StatefulWidget {
  final AlphaRoutes page;

  const AlphaDrawerWidget({Key? key, required this.page}) : super(key: key);

  @override
  _AlphaDrawerWidgetState createState() => _AlphaDrawerWidgetState();
}

class _AlphaDrawerWidgetState extends State<AlphaDrawerWidget> {
  late BuildContext drawerContext;
  late AlphaRoutes page;

  DrawerModel get model =>
      Provider.of<DrawerModel>(drawerContext, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getActiveSwimmer();
      model.getRegisterState();
    });
  }

  @override
  Widget build(BuildContext context) {
    drawerContext = context;
    page = widget.page;
    return getDrawer();
  }

  getDrawer() {
    return Drawer(
      backgroundColor: AlphaColors.backDrawer,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          getHeaderOfDrawer(),
          getHomeTile(),
          getPhoneTile(),
          getChangeUserTile(),
          getPeriodsTile(),
          getAboutUsTile(),
          getContactUsTile(),
          getTopSwimmersTile(),
          getAlphaClubTile(),
          getTeamsTile()
        ],
      ),
    );
  }

  getHeaderOfDrawer() {
    return Selector<DrawerModel, SwimmerResult>(
        selector: (_, model) => model.activeSwimmer,
        builder: (context, swimmerResult, child) {
          return DrawerHeader(
              decoration: BoxDecoration(color: AlphaColors.backDrawer),
              child: getHeaderContent(swimmerResult: swimmerResult));
        });
  }

  getHeaderContent({required SwimmerResult swimmerResult}) {
    if (swimmerResult is SuccessSwimmer) {
      return GestureDetector(
        child: Column(
          children: [
            getAvatarImageDrawer(swimmerResult.swimmer.image),
            getAlphaTextTitle1White(swimmerResult.swimmer.fullName)
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        onTap: () {
          showProfileRoute();
        },
      );
    } else if (swimmerResult is ErrorSwimmer) {
      if (swimmerResult.code == 11) {
        return Column(
          children: [/*getAvatarImageDrawerEmpty(),*/ getLoadingView()],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        );
      } else {
        return Column(
          children: [
            getAvatarImageDrawerEmpty(),
            getAlphaDialogButtonCancel(
                text: getAppLocalization(context).registerNow,
                onPressed: () {
                  showRegisterPhoneDialog();
                })
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        );
      }
    }
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
      width: 20,
    );
  }

  getHomeTile() {
    return (page == AlphaRoutes.Home)
        ? getListTileHomeSelected()
        : getListTileHomeUnSelected();
  }

  getPhoneTile() {
    return Selector<DrawerModel, RegisterState>(
        selector: (_, model) => model.registerState,
        builder: (context, registerState, child) {
          return (registerState == RegisterState.OK)
              ? getListTileChangePhoneUnSelected()
              : getListTileRegisterPhoneUnSelected();
        });
  }

  getChangeUserTile() {
    return Selector<DrawerModel, RegisterState>(
        selector: (_, model) => model.registerState,
        builder: (context, registerState, child) {
          return getListTileChangeUserUnSelected(
              registerState == RegisterState.OK);
        });
  }

////////////// Get Tiles ////////////////////

  getListTileHomeSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.home,
          icon: 'assets/images/ic_menu_home.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileHomeUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.home,
          icon: 'assets/images/ic_menu_home_unselected.png'),
      onTap: () {
        showFirstPageRoute();
      },
    );
  }

  getPeriodsTile() {
    return (page == AlphaRoutes.Periods)
        ? getListTilePeriodsSelected()
        : getListTilePeriodsUnSelected();
  }

  getListTilePeriodsSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.periods,
          icon: 'assets/images/ic_menu_periods.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTilePeriodsUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.periods,
          icon: 'assets/images/ic_menu_periods_unselected.png'),
      onTap: () {
        showPeriodsRoute();
      },
    );
  }

  getAboutUsTile() {
    return (page == AlphaRoutes.AboutUs)
        ? getListTileAboutUsSelected()
        : getListTileAboutUsUnSelected();
  }

  getListTileAboutUsSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.aboutUs,
          icon: 'assets/images/ic_menu_about_us.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileAboutUsUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.aboutUs,
          icon: 'assets/images/ic_menu_about_us_unselected.png'),
      onTap: () {
        showAboutUsRoute();
      },
    );
  }

  getTeamsTile() {
    return (page == AlphaRoutes.Teams)
        ? getListTileTeamsSelected()
        : getListTileTeamsUnSelected();
  }

  getListTileTeamsSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.inTeamChallenges,
          icon: 'assets/images/ic_menu_alpha_teams.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileTeamsUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.inTeamChallenges,
          icon: 'assets/images/ic_menu_about_us_unselected.png'),
      onTap: () {
        showTeamsRoute();
      },
    );
  }

  // getYYYTile() {
  //   return (page == AlphaRoutes.YYY)
  //       ? getListTileYYYSelected()
  //       : getListTileYYYUnSelected();
  // }
  // getListTileYYYSelected() {
  //   return ListTile(
  //     tileColor: AlphaColors.Yellow,
  //     title: getDrawerElementSelected(
  //         title: AppLocalizations.of(drawerContext)!.xxx,
  //         icon: 'assets/images/ic_menu_xxx.png'),
  //     onTap: () {
  //       resetRegisterState();
  //       Navigator.pop(drawerContext);
  //     },
  //   );
  // }
  //
  // getListTileYYYUnSelected() {
  //   return ListTile(
  //     title: getDrawerElement(
  //         title: AppLocalizations.of(drawerContext)!.xxx,
  //         icon: 'assets/images/ic_menu_xxx_unselected.png'),
  //     onTap: () {
  //       Navigator.pushReplacement(drawerContext,
  //           MaterialPageRoute(builder: (context) => FirstPage()));
  //     },
  //   );
  // }
  getTopSwimmersTile() {
    return (page == AlphaRoutes.TopSwimmers)
        ? getListTileTopSwimmersSelected()
        : getListTileTopSwimmersUnSelected();
  }

  getListTileTopSwimmersSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.topSwimmers,
          icon: 'assets/images/ic_menu_top_swimmers.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileTopSwimmersUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.topSwimmers,
          icon: 'assets/images/ic_menu_top_swimmers_unselected.png'),
      onTap: () {
        showTopSwimmersRoute();
      },
    );
  }

  getAlphaClubTile() {
    return (page == AlphaRoutes.AlphaClub)
        ? getListTileAlphaClubSelected()
        : getListTileAlphaClubUnSelected();
  }

  getListTileAlphaClubSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.alphaClub,
          icon: 'assets/images/ic_menu_alpha.png'),
      onTap: () {
        // resetRegisterState();
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileAlphaClubUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.alphaClub,
          icon: 'assets/images/ic_menu_alpha_unselected.png'),
      onTap: () {
        showAlphaClubRoute();
      },
    );
  }

  getContactUsTile() {
    return (page == AlphaRoutes.ContactUs)
        ? getListTileContactUsSelected()
        : getListTileContactUsUnSelected();
  }

  getListTileContactUsSelected() {
    return ListTile(
      tileColor: AlphaColors.Yellow,
      title: getDrawerElementSelected(
          title: AppLocalizations.of(drawerContext)!.contactUs,
          icon: 'assets/images/ic_menu_contact_us.png'),
      onTap: () {
        Navigator.pop(drawerContext);
      },
    );
  }

  getListTileContactUsUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.contactUs,
          icon: 'assets/images/ic_menu_contact_us_unselected.png'),
      onTap: () {
        showContactUsRoute();
      },
    );
  }

  // getXXXTile() {
  //   return (page == AlphaRoutes.XXX)
  //       ? getListTileXXXSelected()
  //       : getListTileXXXUnSelected();
  // }
  // getListTileXXXSelected() {
  //   return ListTile(
  //     tileColor: AlphaColors.Yellow,
  //     title: getDrawerElementSelected(
  //         title: AppLocalizations.of(drawerContext)!.xxx,
  //         icon: 'assets/images/ic_menu_xxx.png'),
  //     onTap: () {
  //       resetRegisterState();
  //       Navigator.pop(drawerContext);
  //     },
  //   );
  // }
  //
  // getListTileXXXUnSelected() {
  //   return ListTile(
  //     title: getDrawerElement(
  //         title: AppLocalizations.of(drawerContext)!.xxx,
  //         icon: 'assets/images/ic_menu_xxx_unselected.png'),
  //     onTap: () {
  //       Navigator.pushReplacement(drawerContext,
  //           MaterialPageRoute(builder: (context) => FirstPage()));
  //     },
  //   );
  // }
  getListTileChangeUserUnSelected(bool visibility) {
    return Visibility(
        visible: visibility,
        child: ListTile(
          title: getDrawerElement(
              title: AppLocalizations.of(drawerContext)!.changeUser,
              icon: 'assets/images/ic_menu_change_users_unselected.png'),
          onTap: () {
            showChangeUserDialog();
          },
        ));
  }

  getListTileChangePhoneUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.changePhoneNumber,
          icon: 'assets/images/ic_menu_register_phone_unselected.png'),
      onTap: () {
        // showChangePhoneDialog();
        showRegisterPhoneDialog();
      },
    );
  }

  getListTileProfileUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.userProfile,
          icon: 'assets/images/ic_menu_profile_unselected.png'),
      onTap: () {},
    );
  }

  getListTileRegisterPhoneUnSelected() {
    return ListTile(
      title: getDrawerElement(
          title: AppLocalizations.of(drawerContext)!.setUserPhone,
          icon: 'assets/images/ic_menu_register_phone_unselected.png'),
      onTap: () {
        showRegisterPhoneDialog();
        // requestActiveSwimmer();
      },
    );
  }

  getDrawerElement({required String title, required String icon}) {
    return Row(
      children: [
        getDrawerIcon(imageAsset: icon),
        getAlphaTextTitle1White(title)
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  getDrawerElementSelected({required String title, required String icon}) {
    return Row(
      children: [
        getDrawerIcon(imageAsset: icon),
        getAlphaTextTitle1Dark(title),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  getDrawerIcon({required String imageAsset}) {
    return SizedBox(
      height: 42,
      width: 42,
      child: TextButton(
        child: Image(image: AssetImage(imageAsset)),
        onPressed: () {},
      ),
    );
  }

  checkRegisterState() async {
    await Provider.of<DrawerModel>(drawerContext, listen: false)
        .getRegisterState();

    var state =
        Provider.of<DrawerModel>(drawerContext, listen: false).registerState;
    switch (state) {
      case RegisterState.Nothing:
        showRegisterPhoneDialog();
        break;
      case RegisterState.Phone:
        showVerifyDialog();
        break;
      case RegisterState.OK:
        requestActiveSwimmer();
        break;
      default:
        return;
    }
  }

  requestActiveSwimmer() {
    Provider.of<DrawerModel>(drawerContext, listen: false).getActiveSwimmer();
  }

  showRegisterPhoneDialog() {
    showDialog(
        context: drawerContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: getRegisterPhoneDialog(),
          );
        }).then((registerState) {
      if (registerState is StateResult) {
        if (registerState.isSuccess) {
          checkRegisterState();
        }
      }
    });
  }

  showVerifyDialog() {
    showDialog(
        context: drawerContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: getVerifyPhoneDialog(),
          );
        }).then((registerState) {
      if (registerState is StateResult) {
        if (registerState.isSuccess) {
          checkRegisterState();
        }
      }
    });
  }

  getRegisterPhoneDialog() {
    return ChangeNotifierProvider<RegisterPhoneModel>(
      create: (_) {
        return RegisterPhoneModel();
      },
      child: RegisterPhoneDialog(),
    );
  }

  getVerifyPhoneDialog() {
    return ChangeNotifierProvider<VerifyPhoneModel>(
      create: (_) {
        return VerifyPhoneModel();
      },
      child: VerifyPhoneDialog(),
    );
  }

  showChangeUserDialog() {
    showDialog(
        context: drawerContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: getChangeUserDialog(),
          );
        }).then((registerState) {
      if (registerState == true) {
        // model.getActiveSwimmer();
      }
    });
  }

  getChangeUserDialog() {
    return ChangeNotifierProvider<ChangeUserModel>(
      create: (_) {
        return ChangeUserModel();
      },
      child: ChangeUserDialog(),
    );
  }

  showChangePhoneDialog() {
    showDialog(
        context: drawerContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: getChangePhoneDialog(),
          );
        }).then((registerState) {
      if (registerState == true) {
        // model.getActiveSwimmer();
      }
    });
  }

  getChangePhoneDialog() {
    return ChangeNotifierProvider<ChangeUserModel>(
      create: (_) {
        return ChangeUserModel();
      },
      child: ChangeUserDialog(),
    );
  }

  showFirstPageRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<FirstPageModel>(
                    create: (context) => FirstPageModel(),
                    child: FirstPage()))));
  }

  showTopSwimmersRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<TopSwimmersModel>(
                    create: (context) => TopSwimmersModel(),
                    child: TopSwimmersRoute()))));
  }

  showAlphaClubRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<AlphaClubModel>(
                    create: (context) => AlphaClubModel(),
                    child: AlphaClubRoute()))));
  }

  showPeriodsRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<PeriodsModel>(
                    create: (context) => PeriodsModel(),
                    child: PeriodRoute()))));
  }

  showProfileRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<ProfileModel>(
                    create: (context) => ProfileModel(),
                    child: ProfileRoute()))));
  }

  showAboutUsRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutUsRoute())));
  }

  showContactUsRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactUsRoute())));
  }

  showTeamsRoute() {
    closeDrawer();
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<AlphaTeamsModel>(
                    create: (context) => AlphaTeamsModel(),
                    child: AlphaTeamsRoute()))));
  }

  closeDrawer() {
    Navigator.pop(context);
  }
}
