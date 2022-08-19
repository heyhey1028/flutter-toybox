// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shop _$$_ShopFromJson(Map<String, dynamic> json) => _$_Shop(
      id: json['id'] as String,
      name: json['name'] as String,
      logoImageUrl: json['logoImageUrl'] as String,
      nameKana: json['nameKana'] as String,
      lat: json['lat'] as int,
      lng: json['lng'] as int,
      capacity: json['capacity'] as int,
      open: json['open'] as String,
      close: DateTime.parse(json['close'] as String),
      photoUrl: Photo.fromJson(json['photoUrl'] as Map<String, dynamic>),
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
      subGenre: Genre.fromJson(json['subGenre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ShopToJson(_$_Shop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoImageUrl': instance.logoImageUrl,
      'nameKana': instance.nameKana,
      'lat': instance.lat,
      'lng': instance.lng,
      'capacity': instance.capacity,
      'open': instance.open,
      'close': instance.close.toIso8601String(),
      'photoUrl': instance.photoUrl,
      'urls': instance.urls,
      'genre': instance.genre,
      'subGenre': instance.subGenre,
    };
