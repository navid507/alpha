import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
enum AvatarImageTypes {
  GoldSwimmer,
  // Add other types as needed
}

class AvatarImageBuilder {
  final String imageUrl;
  final AvatarImageTypes type;

  double _size = 40.0;
  double _margin = 4.0;
  Color _borderColor = Colors.grey;
  double _borderSize = 1.0;

  AvatarImageBuilder({required this.imageUrl, required this.type});

  AvatarImageBuilder setSize({required double size}) {
    _size = size;
    return this;
  }

  AvatarImageBuilder setMargin({required double margin}) {
    _margin = margin;
    return this;
  }

  AvatarImageBuilder setBorderColor({required Color borderColor}) {
    _borderColor = borderColor;
    return this;
  }

  AvatarImageBuilder setBorderSize({required double borderSize}) {
    _borderSize = borderSize;
    return this;
  }

  Widget build() {
    return Container(
      margin: EdgeInsets.all(_margin),
      height: _size,
      width: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _borderColor, width: _borderSize),
      ),
      child: ClipOval(
        child: ImageNetwork(
          image: imageUrl,
          onLoading: const CircularProgressIndicator(color: Colors.green), // Customize
          onError: const Icon(Icons.broken_image),
          height: _size,
          width: _size,
          fitWeb: BoxFitWeb.cover,
        ),
      ),
    );
  }
}