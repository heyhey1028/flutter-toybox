// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hp_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HpApiResponse _$$_HpApiResponseFromJson(Map<String, dynamic> json) =>
    _$_HpApiResponse(
      resultAvailable: json['resultAvailable'] as int,
      resultReturned: json['resultReturned'] as int,
      resultStart: json['resultStart'] as int,
      shop: (json['shop'] as List<dynamic>?)
          ?.map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HpApiResponseToJson(_$_HpApiResponse instance) =>
    <String, dynamic>{
      'resultAvailable': instance.resultAvailable,
      'resultReturned': instance.resultReturned,
      'resultStart': instance.resultStart,
      'shop': instance.shop,
    };
