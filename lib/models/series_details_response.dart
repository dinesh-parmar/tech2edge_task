// To parse this JSON data, do
//
//     final seriesDetailResponse = seriesDetailResponseFromJson(jsonString);

import 'dart:convert';

class SeriesDetailResponse {
  SeriesDetailResponse({
    this.characters,
    this.series,
  });

  List<Character>? characters;
  Series? series;

  factory SeriesDetailResponse.fromRawJson(String str) => SeriesDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeriesDetailResponse.fromJson(Map<String, dynamic> json) => SeriesDetailResponse(
        characters: List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),
        series: Series.fromJson(json["series"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters != null ? List<dynamic>.from(characters!.map((x) => x.toJson())) : null,
        "series": series?.toJson(),
      };
}

class Character {
  Character({
    this.id,
    this.name,
    this.age,
    this.profession,
    this.img,
  });

  int? id;
  String? name;
  int? age;
  String? profession;
  String? img;

  factory Character.fromRawJson(String str) => Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "profession": profession,
        "img": img,
      };
}

class Series {
  Series({
    this.title,
    this.ott,
    this.img,
    this.desc,
  });

  String? title;
  String? ott;
  String? img;
  String? desc;

  factory Series.fromRawJson(String str) => Series.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        title: json["title"],
        ott: json["ott"],
        img: json["img"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ott": ott,
        "img": img,
        "desc": desc,
      };
}
