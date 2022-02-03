import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/first_page_screen.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_widgets/get_image.dart';

enum AlphaRoutes {
  Splash,
  Home,
  ChangeUser,
  Periods,
  Profile,
  AboutUs,
  ContactUs,
  TopSwimmers,
  AlphaClub,
  Teams,
  RegisteredPeriods,
  MedicalSessions,
  Sessions,
  SessionDetails,
}

class AlphaHeader {
  late BuildContext drawerContext;

  AlphaHeader({required this.drawerContext, this.needBack = true});

  bool needBack;

  getHeader() {
    return Stack(children: [getImageOfHeader()]);
  }

  getTopMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 12, right: 12, top: AlphaSizes.getTopPadding(constValue: 12)),
      child: Row(
        children: [
          getMenuIcon(
              imageAsset: 'assets/images/ic_menu.png',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
          Spacer(),
          getLogoImage(),
          Spacer(),
          getEndIcon(context)
        ],
      ),
    );
  }

  getEndIcon(BuildContext context) {
    if (needBack) {
      return GestureDetector(
        child: Icon(
          Icons.arrow_forward_ios,
          color: AlphaColors.White,
          size: 24,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      );
    } else {
      return getEmptyIcon();
    }
  }

  getTopHeader() {
    return Padding(
      padding: EdgeInsets.only(top: AlphaSizes.getTopPadding(constValue: 30)),
      child: Row(
        children: [
          Spacer(),
          getLogoImage(),
          Spacer(),
        ],
      ),
    );
  }

  getImageOfHeader() {
    return FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.3,
        child: Opacity(
            opacity: 0.4,
            child: Image(
                image: AssetImage('assets/images/header_swimmer.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center)));
  }
}

//   getList() {
//     // drawerContext = buildContext;
//     return Drawer(
//       backgroundColor: AlphaColors.backDrawer,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [getHeaderOfDrawer(), getHomeTile(), getChangeUserTile()],
//       ),
//     );
//   }
//
//   getHeaderOfDrawer() {
//     return Selector<FirstPageModel, String>(
//         selector: (_, model) => model.activeSwimmer?.image ?? "",
//         builder: (context, swimmerImage, child) {
//           // var l = 'my name';
//           return DrawerHeader(
//               decoration: BoxDecoration(color: AlphaColors.backDrawer),
//               child: Text(swimmerImage));
//         });
//   }
//
//   getHomeTile() {
//     return (page == AlphaRoutes.Home)
//         ? getListTileHomeSelected()
//         : getListTileHomeUnSelected();
//   }
//
//   getChangeUserTile() {
//     return (isRegistered)
//         ? getListTileChangeUserUnSelected()
//         : getListTileRegisterPhoneUnSelected();
//   }
//
//   getDrawerElement({required String title, required String icon}) {
//     return Row(
//       children: [
//         getDrawerIcon(imageAsset: icon),
//         getAlphaTextTitle1White(title)
//       ],
//       crossAxisAlignment: CrossAxisAlignment.center,
//     );
//   }
//
//   getDrawerElementSelected({required String title, required String icon}) {
//     return Row(
//       children: [
//         getDrawerIcon(imageAsset: icon),
//         getAlphaTextTitle1Dark(title)
//       ],
//       crossAxisAlignment: CrossAxisAlignment.center,
//     );
//   }
//
//   getDrawerIcon({required String imageAsset}) {
//     return SizedBox(
//       height: 42,
//       width: 42,
//       child: TextButton(
//         child: Image(image: AssetImage(imageAsset)),
//         onPressed: () {},
//       ),
//     );
//   }
//
//   ////////////// Get Tiles ////////////////////
//
//   getListTileHomeSelected() {
//     return ListTile(
//       tileColor: AlphaColors.Yellow,
//       title: getDrawerElementSelected(
//           title: AppLocalizations.of(drawerContext)!.home,
//           icon: 'assets/images/ic_menu_home.png'),
//       onTap: () {
//         Navigator.pop(drawerContext);
//       },
//     );
//   }
//
//   getListTileHomeUnSelected() {
//     return ListTile(
//       title: getDrawerElement(
//           title: AppLocalizations.of(drawerContext)!.home,
//           icon: 'assets/images/ic_menu_home_unselected.png'),
//       onTap: () {
//         Navigator.pushReplacement(drawerContext,
//             MaterialPageRoute(builder: (context) => FirstPage()));
//       },
//     );
//   }
//
//   getListTileChangeUserSelected() {
//     return ListTile(
//       tileColor: AlphaColors.Yellow,
//       title: getDrawerElementSelected(
//           title: AppLocalizations.of(drawerContext)!.changeUser,
//           icon: 'assets/images/ic_menu_change_users.png'),
//       onTap: () {
//         Navigator.pop(drawerContext);
//       },
//     );
//   }
//
//   getListTileChangeUserUnSelected() {
//     return ListTile(
//       title: getDrawerElement(
//           title: AppLocalizations.of(drawerContext)!.changeUser,
//           icon: 'assets/images/ic_menu_change_users_unselected.png'),
//       onTap: () {
//         Navigator.pushReplacement(drawerContext,
//             MaterialPageRoute(builder: (context) => FirstPage()));
//       },
//     );
//   }
//
//   getListTileProfileSelected() {
//     return ListTile(
//       tileColor: AlphaColors.Yellow,
//       title: getDrawerElementSelected(
//           title: AppLocalizations.of(drawerContext)!.userProfile,
//           icon: 'assets/images/ic_menu_profile.png'),
//       onTap: () {
//         Navigator.pop(drawerContext);
//       },
//     );
//   }
//
//   getListTileProfileUnSelected() {
//     return ListTile(
//       title: getDrawerElement(
//           title: AppLocalizations.of(drawerContext)!.userProfile,
//           icon: 'assets/images/ic_menu_profile_unselected.png'),
//       onTap: () {
//         Navigator.pushReplacement(drawerContext,
//             MaterialPageRoute(builder: (context) => FirstPage()));
//       },
//     );
//   }
//
//   getListTileRegisterPhoneSelected() {
//     return ListTile(
//       tileColor: AlphaColors.Yellow,
//       title: getDrawerElementSelected(
//           title: AppLocalizations.of(drawerContext)!.setUserPhone,
//           icon: 'assets/images/ic_menu_register_phone.png'),
//       onTap: () {
//         Navigator.pop(drawerContext);
//       },
//     );
//   }
//
//   getListTileRegisterPhoneUnSelected() {
//     return ListTile(
//       title: getDrawerElement(
//           title: AppLocalizations.of(drawerContext)!.setUserPhone,
//           icon: 'assets/images/ic_menu_register_phone_unselected.png'),
//       onTap: () {
//         showRegisterPhoneDialog();
//       },
//     );
//   }
//
// /*
//   getListTilexxxSelected() {
//     return ListTile(
//       tileColor: AlphaColors.Yellow,
//       title: getDrawerElementSelected(
//           title: AppLocalizations.of(drawerContext)!.xxx,
//           icon: 'assets/images/ic_menu_xxx.png'),
//       onTap: () {
//         Navigator.pop(drawerContext);
//       },
//     );
//   }
//
//   getListTilexxxUnSelected() {
//     return ListTile(
//       title: getDrawerElement(
//           title: AppLocalizations.of(drawerContext)!.xxx,
//           icon: 'assets/images/ic_menu_xxx_unselected.png'),
//       onTap: () {
//         Navigator.pushReplacement(drawerContext,
//             MaterialPageRoute(builder: (context) => FirstPage()));
//       },
//     );
//   }
//   */
//
//   showRegisterPhoneDialog() {
//
//   }
