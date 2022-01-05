import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_alpha_slider.dart';
import 'package:alpha/ui/my_widgets/get_header.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  BuildContext? apContext;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<FirstPageModel>(apContext!, listen: false).getGallery();
      Provider.of<FirstPageModel>(apContext!, listen: false).getTopSwimmers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ChangeNotifierProvider<FirstPageModel>(
        create: (context) => FirstPageModel(),
        child: Scaffold(
            drawer: getDrawer(context),
            body: Builder(builder: (context) => getScreenBody(context))));
  }

  getScreenBody(BuildContext screenBodyContext) {
    apContext = screenBodyContext;

    return Stack(children: [
      getImageOfHeader(),
      Column(
        children: [
          getTopMenu(screenBodyContext),
          getGallerySlider(),
          getTopSwimmersHeader()
        ],
      ),
    ]);
  }

  getGallerySlider() {
    return Selector<FirstPageModel, AlphaImageGallery?>(
        selector: (_, model) => model.alphaImageGallery,
        builder: (galleyContext, gallery, child) {
          if (gallery == null) {
            return getSlider(
                AlphaImageGallery(images: [
                  AlphaImageItem(
                      id: 'id',
                      title: '... در حال بارگذاری',
                      content: 'content',
                      link: 'link',
                      image: 'assets/images/splash_screen.png')
                ]),
                getScreenWidth(context));
          } else {
            return getSlider(gallery, getScreenWidth(context));
          }
        });
  }

  // getTopSwimmersSection()
  // {
  //   return Column(children: [],);
  // }
  getTopSwimmersHeader() {
    return Container(
        padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
        child: Row(
          children: [
            getMenuIcon(imageAsset: 'assets/images/ic_swimmer.png'),
            getAlphaTextTitle1White(AppLocalizations.of(context)!.topSwimmers),
            Spacer(),
            GestureDetector(
                onTap: () {
                  showTopSwimmers();
                },
                child:
                    getAlphaTextMoreYellow(AppLocalizations.of(context)!.more)),
          ],
        ));
  }

  showTopSwimmers() {}
// getTopSwimmersRow() {
//   return Selector<FirstPageModel, TopSwimmers?>(
//       selector: (_, model) => model.alphaTopSwimmers,
//       builder: (galleyContext, topSwimmers, child) {
//         if (topSwimmers == null) {
//
//         } else {
//         }
//       });
// }

// 375 - (123 + 100 + 100)
}
