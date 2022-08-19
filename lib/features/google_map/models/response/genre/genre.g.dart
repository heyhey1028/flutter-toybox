// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Genre _$$_GenreFromJson(Map<String, dynamic> json) => _$_Genre(
      code: $enumDecode(_$GenreCodeEnumMap, json['code']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_GenreToJson(_$_Genre instance) => <String, dynamic>{
      'code': _$GenreCodeEnumMap[instance.code]!,
      'name': instance.name,
    };

const _$GenreCodeEnumMap = {
  GenreCode.izakaya: 'izakaya',
  GenreCode.dining_bar: 'dining_bar',
  GenreCode.sosaku: 'sosaku',
  GenreCode.washoku: 'washoku',
  GenreCode.yoshoku: 'yoshoku',
  GenreCode.italian_french: 'italian_french',
  GenreCode.chinese: 'chinese',
  GenreCode.yakiniku: 'yakiniku',
  GenreCode.asian_ethnic: 'asian_ethnic',
  GenreCode.country: 'country',
  GenreCode.karaoke: 'karaoke',
  GenreCode.bar: 'bar',
  GenreCode.ramen: 'ramen',
  GenreCode.cafe_sweets: 'cafe_sweets',
  GenreCode.others: 'others',
  GenreCode.okonomiyaki: 'okonomiyaki',
  GenreCode.korean: 'korean',
};
