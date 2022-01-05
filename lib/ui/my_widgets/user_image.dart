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

  const AvatarImage(
      {Key? key,
      required this.imageUrl,
      this.type = AvatarImageType.User,
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
        // TODO: Handle this case.
        break;
      case AvatarImageType.SilverSwimmer:
        // TODO: Handle this case.
        break;
      case AvatarImageType.BronzeSwimmer:
        // TODO: Handle this case.
        break;
    }
    return Container(
      alignment: Alignment.center,
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
