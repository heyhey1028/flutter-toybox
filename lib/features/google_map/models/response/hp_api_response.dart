import 'package:flutter_toybox/features/google_map/models/response/shop/shop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hp_api_response.freezed.dart';
part 'hp_api_response.g.dart';

@freezed
class HpApiResponse with _$HpApiResponse {
  factory HpApiResponse({
    required int resultAvailable,
    required int resultReturned,
    required int resultStart,
    List<Shop>? shop,
  }) = _HpApiResponse;

  factory HpApiResponse.fromJson(Map<String, dynamic> json) =>
      _$HpApiResponseFromJson(json);
}
