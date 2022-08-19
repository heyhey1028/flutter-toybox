import 'package:flutter_toybox/features/google_map/models/response/genre/genre.dart';
import 'package:flutter_toybox/features/google_map/models/response/photo/photo.dart';
import 'package:flutter_toybox/features/google_map/models/response/urls/urls.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop {
  factory Shop({
    required String id,
    required String name,
    required String logoImageUrl,
    required String nameKana,
    required int lat,
    required int lng,
    required int capacity,
    required String open,
    required DateTime close,
    required Photo photoUrl,
    required Urls urls,
    required Genre genre,
    required Genre subGenre,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}
