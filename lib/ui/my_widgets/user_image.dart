import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

enum AvatarImageType {
  User,
  Swimmer,
  GoldSwimmer,
  SilverSwimmer,
  BronzeSwimmer,
  FirstInTeam,
  NextInTeam
}

class AvatarImage extends StatelessWidget {
  final String imageUrl;
  final AvatarImageType type;
  final double margin;
  final double size;
  final double? width;
  final double? height;
  final Color borderColor;
  final Color? backColor;
  final double borderSize;
  final bool isAsset;

  const AvatarImage(
      {Key? key,
      required this.imageUrl,
      this.type = AvatarImageType.User,
      this.size = 50.0,
      this.width,
      this.height,
      this.margin = 5.0,
      this.borderSize = 5.0,
      this.backColor,
      this.borderColor = AlphaColors.Yellow,
      this.isAsset = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: (width != null) ? width : size * 2,
      height: (height != null) ? height : size * 2,
      child: CircleAvatar(
        radius: size,
        backgroundColor: backColor,
        backgroundImage: (imageUrl.isEmpty)
            ? null
            : (isAsset)
                ? AssetImage(imageUrl)
                : NetworkImage(imageUrl) as ImageProvider,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderSize)),
    );
  }
}

class AvatarImageBuilder {
  late String imageUrl;
  late AvatarImageType type;
  double _margin = 0;
  double _size = 16;
  double? width;
  double? height;
  Color _borderColor = AlphaColors.White;
  Color? backColor;
  double _borderSize = 0;
  bool isAsset = false;

  AvatarImageBuilder({required this.imageUrl, required this.type});

  AvatarImageBuilder setMargin({required double margin}) {
    this._margin = margin;
    return this;
  }

  AvatarImageBuilder setWidth({required double width}) {
    this.width = width;
    return this;
  }

  AvatarImageBuilder setHeight({required double height}) {
    this.height = height;
    return this;
  }

  AvatarImageBuilder setAsset({required bool isAsset}) {
    this.isAsset = isAsset;
    return this;
  }

  AvatarImageBuilder setSize({required double size}) {
    this._size = size;
    return this;
  }

  AvatarImageBuilder setBorderColor({required Color borderColor}) {
    this._borderColor = borderColor;
    return this;
  }

  AvatarImageBuilder setBackColor({required Color backColor}) {
    this.backColor = backColor;
    return this;
  }

  AvatarImageBuilder setBorderSize({required double borderSize}) {
    this._borderSize = borderSize;
    return this;
  }

  AvatarImage build() {
    return AvatarImage(
      imageUrl: imageUrl,
      type: type,
      margin: _margin,
      size: _size,
      backColor: backColor,
      borderColor: _borderColor,
      borderSize: _borderSize,
      isAsset: isAsset,
      width: width,
      height: height,
    );
  }
}

getAvatarImageDrawerEmpty() {
  return AvatarImageBuilder(imageUrl: "", type: AvatarImageType.GoldSwimmer)
      .setSize(size: 30.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 3.0)
      .build();
}

getAvatarImageDrawer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 30.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 3.0)
      .build();
}

getAvatarImageFirstTopSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 40.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 3.0)
      .build();
}

getAvatarImageSecondTopSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 35.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Silver)
      .setBorderSize(borderSize: 2.0)
      .build();
}

getAvatarImageThirdTopSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 35.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Bronze)
      .setBorderSize(borderSize: 2.0)
      .build();
}

getAvatarImageFirstInTeamSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 18.0)
      .setMargin(margin: 0.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 2)
      .build();
}

getAvatarImageNextInTeamSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 14.0)
      .setMargin(margin: 0.0)
      .setBorderColor(borderColor: AlphaColors.White)
      .setBorderSize(borderSize: 1.5)
      .build();
}

getAvatarImageAlphaClub(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 35.0)
      .setMargin(margin: 8.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 2.0)
      .build();
}


getAvatarImageConnectedSwimmerActive(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 22.0)
      .setMargin(margin: 8.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 2.0)
      .build();
}

getAvatarImageConnectedSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 22.0)
      .setMargin(margin: 8.0)
      .setBorderColor(borderColor: AlphaColors.Silver)
      .setBorderSize(borderSize: 1.0)
      .build();
}

getAvatarImageRegisterForm(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 40.0)
      .setAsset(isAsset: true)
      .setMargin(margin: 12.0)
      .setBorderSize(borderSize: 0.0)
      .setBorderColor(borderColor: AlphaColors.White.withAlpha(30))
      .setBackColor(backColor: AlphaColors.White.withAlpha(30))
      .build();
}

getAvatarImageAlphaClubSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 45.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 3.0)
      .build();
}

getAvatarImageBetaClubSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 30.0)
      .setMargin(margin: 3.0)
      .setBorderColor(borderColor: AlphaColors.Silver)
      .setBorderSize(borderSize: 1.0)
      .build();
}

getAvatarImageOmegaSwimmer(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 25.0)
      .setMargin(margin: 3.0)
      .setBorderColor(borderColor: AlphaColors.Bronze)
      .setBorderSize(borderSize: 1.0)
      .build();
}

getAvatarImageTeacherSmall(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 20.0)
      .setMargin(margin: 2.0)
      .setBorderColor(borderColor: AlphaColors.White)
      .setBorderSize(borderSize: 1.0)
      .build();
}

getAvatarImagePeriodSmall(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 20.0)
      .setBackColor(backColor: AlphaColors.White.withAlpha(10))
      .setAsset(isAsset: true)
      .setMargin(margin: 2.0)
      .setBorderColor(borderColor: AlphaColors.White.withAlpha(10))
      .setBorderSize(borderSize: 1.0)
      .build();
}

getAvatarImageFirstInTeamSwimmerMain(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 30.0)
      .setMargin(margin: 7.0)
      .setBorderColor(borderColor: AlphaColors.Gold)
      .setBorderSize(borderSize: 2)
      .build();
}

getAvatarImageNextInTeamSwimmerMain(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 23.0)
      .setMargin(margin: 0.0)
      .setBorderColor(borderColor: AlphaColors.White)
      .setBorderSize(borderSize: 1.5)
      .build();
}

getAvatarImageProfile(String image) {
  return AvatarImageBuilder(imageUrl: image, type: AvatarImageType.GoldSwimmer)
      .setSize(size: 30.0)
      .setMargin(margin: 5.0)
      .setBorderColor(borderColor: AlphaColors.White)
      .setBorderSize(borderSize: 1.5)
      .build();
}
/*
// double size = 50.0;
    // switch (type) {
    //   case AvatarImageType.User:
    //     border = 5.0;
    //     borderColor = AlphaColors.Yellow;
    //     size = 50.0;
    //     break;
    //   case AvatarImageType.Swimmer:
    //     border = 3.0;
    //     borderColor = AlphaColors.Yellow;
    //     size = 40.0;
    //     break;
    //   case AvatarImageType.GoldSwimmer:
    //     border = 3.0;
    //     borderColor = AlphaColors.Yellow;
    //     size = 40.0;
    //     break;
    // }
 */
