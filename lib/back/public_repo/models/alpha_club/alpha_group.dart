import 'dart:ffi';

import 'alpha_swimmer.dart';


class AlphaGroup {

  List<AlphaSwimmer> swimmers;
  String title;

  AlphaGroup({required this.title, required this.swimmers});

  factory AlphaGroup.fromJson(Map<String, dynamic> json){
    List<AlphaSwimmer> tSwimmers = List.empty(growable: true);
    List<dynamic> jSwimmers = json['list'];
    jSwimmers.forEach((element) {
      AlphaSwimmer alphaSwimmer = AlphaSwimmer.fromJson(element);
      tSwimmers.add(alphaSwimmer);
    });

    return AlphaGroup(title: json['title'], swimmers: tSwimmers);

  }

}