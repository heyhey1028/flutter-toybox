import 'package:freezed_annotation/freezed_annotation.dart';

part 'hp_api_request.freezed.dart';

@freezed
class HpApiRequest with _$HpApiRequest {
  factory HpApiRequest({
    required String key,
    String? keyword,
    double? lat,
    double? lng,
    int? range,
    String? genre,
    int? wifi,
    int? privateRoom,
    int? nonSmoking,
    int? card,
    int? openAir,
    int? lunch,
    int? english,
    int? pet,
    int? child,
  }) = _HpApiRequest;
}
