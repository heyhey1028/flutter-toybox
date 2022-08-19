import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile.freezed.dart';
part 'mobile.g.dart';

@freezed
class Mobile with _$Mobile {
  factory Mobile({
    required String l,
    required String s,
  }) = _Mobile;

  factory Mobile.fromJson(Map<String, dynamic> json) => _$MobileFromJson(json);
}
