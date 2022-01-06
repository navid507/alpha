import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

enum AvatarImageType {
  User,
  Swimmer,
  GoldSwimmer,
  SilverSwimmer,
  BronzeSwimmer
}

class AvatarImage extends StatelessWidget {
  final String imageUrl;
  final AvatarImageType type;
  final double margin;
  final double size;

  const AvatarImage(
      {Key? key,
      required this.imageUrl,
      this.type = AvatarImageType.User,
      this.size = 50.0,
      this.margin = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = AlphaColors.Yellow;
    double border = 5.0;
    double size = 50.0;
    switch (type) {
      case AvatarImageType.User:
        border = 5.0;
        borderColor = AlphaColors.Yellow;
        size = 50.0;
        break;
      case AvatarImageType.Swimmer:
        border = 3.0;
        borderColor = AlphaColors.Yellow;
        size = 40.0;
        break;
      case AvatarImageType.GoldSwimmer:
        border = 3.0;
        borderColor = AlphaColors.Yellow;
        size = 40.0;
        break;
      case AvatarImageType.SilverSwimmer:
        border = 2.0;
        borderColor = AlphaColors.Silver;
        size = 35.0;
        break;
      case AvatarImageType.BronzeSwimmer:
        border = 2.0;
        borderColor = AlphaColors.Bronze;
        size = 35.0;
        break;
    }
    return Container(
      margin: EdgeInsets.all(margin),
      child: CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(imageUrl),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: border)),
    );
  }
}

getAvatarImageFirstTopSwimmer(String image) {
  return AvatarImage(imageUrl: image, type: AvatarImageType.GoldSwimmer);
}

getAvatarImageSecondTopSwimmer(String image) {
  return AvatarImage(imageUrl: image, type: AvatarImageType.SilverSwimmer);
}

getAvatarImageThirdTopSwimmer(String image) {
  return AvatarImage(imageUrl: image, type: AvatarImageType.BronzeSwimmer);
}
