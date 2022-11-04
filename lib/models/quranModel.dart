// To parse this JSON data, do
//
//     final quranModel = quranModelFromJson(jsonString);

import 'dart:convert';

List<QuranModel> quranModelFromJson(String str) =>
    List<QuranModel>.from(json.decode(str).map((x) => QuranModel.fromJson(x)));

class QuranModel {
  QuranModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  RevelationType? revelationType;
  List<Ayah>? ayahs;

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: revelationTypeValues.map![json["revelationType"]],
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
      );
}

class Ayah {
  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic? sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );
}

class SajdaClass {
  SajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });

  int? id;
  bool? recommended;
  bool? obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues(
    {"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
