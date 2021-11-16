
import 'dart:convert';

import 'alpha_group.dart';

class AlphaClub {
  AlphaGroup alphaSwimmers;
  AlphaGroup betaSwimmers;
  AlphaGroup omegaSwimmers;
  String? title;

  AlphaClub(
      {required this.alphaSwimmers,
      required this.betaSwimmers,
      required this.omegaSwimmers,
      this.title});

  factory AlphaClub.fromJson(Map<String, dynamic> json) {
     // = jsonDecode(jsonString);
    return AlphaClub(
        alphaSwimmers: AlphaGroup.fromJson(json['alpha']),
        betaSwimmers: AlphaGroup.fromJson(json['beta']),
        omegaSwimmers: AlphaGroup.fromJson(json['omega']),
        title: json['title']);
  }
}
