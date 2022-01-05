import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_alpha_slider.dart';
import 'package:alpha/ui/my_widgets/get_header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ChangeNotifierProvider<FirstPageModel>(
        create: (context) => FirstPageModel(),
        child: Scaffold(
            endDrawer: getDrawer(context),
            body: Builder(builder: (context) => getScreenBody(context))));
  }

  getScreenBody(BuildContext screenBodyContext) {
    apContext = screenBodyContext;

    return Stack(children: [
      getImageOfHeader(),
      Column(
        children: [getTopMenu(screenBodyContext), getGallerySlider()],
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



}
