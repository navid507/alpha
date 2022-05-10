import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/gallery/gallery_model.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/period_sessions/period_sessions_model.dart';
import 'package:alpha/ui/session_details_dialog/session_details_dialog.dart';
import 'package:alpha/ui/session_details_dialog/session_details_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

class GalleryPhotoView extends StatefulWidget {
  const GalleryPhotoView({Key? key}) : super(key: key);

  @override
  _GalleryPhotoViewState createState() => _GalleryPhotoViewState();
}

class _GalleryPhotoViewState extends State<GalleryPhotoView> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAllPeriodSessions();
    });
    super.initState();
  }

  GalleryModel get model => Provider.of<GalleryModel>(context, listen: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.Gallery),
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
        child: getAlphaPageTitleWhite(getAppLocalization(context).gallery));
  }

  getMainSectionView() {
    return Selector<GalleryModel, LoadingState>(
        selector: (_, topSwimmerModel) =>
            topSwimmerModel.alphaImageGallerySessionsState,
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
                return getGallery();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getGallery() {
    var allImages = model.alphaImageGallery!.images;
    List<Widget> all = allImages.map<Widget>((period) {
      return getImageView(period);
    }).toList();
    return PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: all.length,
        builder: (BuildContext galleryContext, int index) {
          return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(allImages[index].image),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.contained * 0.8);
        });
    // return GridView.count(
    //     childAspectRatio: 0.7, crossAxisCount: 3, children: all);
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
              model.getAllPeriodSessions();
            }));
  }

  getImageView(AlphaImageItem image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AlphaColors.backDrawer),
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        image.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            child: getAlphaTextBodyWhiteGallery(image.title),
          )
        ],
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     // showImageDialog(image);
    //   },
    //   child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Container(
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8),
    //             color: AlphaColors.backDrawer),
    //         child: Stack(
    //           children: [
    //             Expanded(
    //               child: Image.network(
    //                 image.image,
    //                 fit: BoxFit.cover,
    //               ),
    //             )
    //           ],
    //         ),
    //       )),
    // );
  }

  getHorizontalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        color: AlphaColors.White.withAlpha(30),
        width: getScreenWidth(context),
        height: 1,
      ),
    );
  }

  getVerticalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: AlphaColors.White.withAlpha(30),
        width: 1,
        height: 15,
      ),
    );
  }

  getSessionState(SessionState state) {
    var text = getAlphaTextBodyWhite('');
    var color = AlphaColors.backDrawer;
    switch (state) {
      case SessionState.NotSpecified:
        text = getAlphaTextTitle1WhiteFit(
            getAppLocalization(context).noSessionYet);

        color = AlphaColors.backTopSwimmers;
        break;
      case SessionState.Absent:
        text = getAlphaTextTitle1White(getAppLocalization(context).absent);
        color = AlphaColors.Red;
        break;
      case SessionState.Present:
        text = getAlphaTextTitle1Dark(getAppLocalization(context).present);
        color = AlphaColors.Yellow;
        break;
    }

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16), topLeft: Radius.circular(8.0))),
      width: 50,
      alignment: Alignment.center,
      child: Padding(padding: EdgeInsets.all(4), child: text),
    );
  }

// showImageDialog(AlphaImageItem image) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           insetPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8.0))),
//           child: getImageDialog(image),
//         );
//       }).then((registerState) {
//     if (registerState is StateResult && registerState.isSuccess) {
//       model.getAllPeriodSessions();
//     }
//   });
// }

// getImageDialog(AlphaImageItem session) {
//   return ChangeNotifierProvider<SessionDetailsModel>(
//     create: (_) {
//       return SessionDetailsModel(curSession: session);
//     },
//     child: SessionDetailsDialog(),
//   );
// }
}
