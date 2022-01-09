import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

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
  final Color borderColor;
  final double borderSize;

  const AvatarImage(
      {Key? key,
      required this.imageUrl,
      this.type = AvatarImageType.User,
      this.size = 50.0,
      this.margin = 5.0,
      this.borderSize = 5.0,
      this.borderColor = AlphaColors.Yellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(imageUrl),
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
  Color _borderColor = AlphaColors.White;
  double _borderSize = 0;

  AvatarImageBuilder({required this.imageUrl, required this.type});

  AvatarImageBuilder setMargin({required double margin}) {
    this._margin = margin;
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
      borderColor: _borderColor,
      borderSize: _borderSize,
    );
  }
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
