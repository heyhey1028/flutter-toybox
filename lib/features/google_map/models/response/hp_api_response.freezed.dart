// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hp_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HpApiResponse _$HpApiResponseFromJson(Map<String, dynamic> json) {
  return _HpApiResponse.fromJson(json);
}

/// @nodoc
mixin _$HpApiResponse {
  int get resultAvailable => throw _privateConstructorUsedError;
  int get resultReturned => throw _privateConstructorUsedError;
  int get resultStart => throw _privateConstructorUsedError;
  List<Shop>? get shop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HpApiResponseCopyWith<HpApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HpApiResponseCopyWith<$Res> {
  factory $HpApiResponseCopyWith(
          HpApiResponse value, $Res Function(HpApiResponse) then) =
      _$HpApiResponseCopyWithImpl<$Res>;
  $Res call(
      {int resultAvailable,
      int resultReturned,
      int resultStart,
      List<Shop>? shop});
}

/// @nodoc
class _$HpApiResponseCopyWithImpl<$Res>
    implements $HpApiResponseCopyWith<$Res> {
  _$HpApiResponseCopyWithImpl(this._value, this._then);

  final HpApiResponse _value;
  // ignore: unused_field
  final $Res Function(HpApiResponse) _then;

  @override
  $Res call({
    Object? resultAvailable = freezed,
    Object? resultReturned = freezed,
    Object? resultStart = freezed,
    Object? shop = freezed,
  }) {
    return _then(_value.copyWith(
      resultAvailable: resultAvailable == freezed
          ? _value.resultAvailable
          : resultAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      resultReturned: resultReturned == freezed
          ? _value.resultReturned
          : resultReturned // ignore: cast_nullable_to_non_nullable
              as int,
      resultStart: resultStart == freezed
          ? _value.resultStart
          : resultStart // ignore: cast_nullable_to_non_nullable
              as int,
      shop: shop == freezed
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as List<Shop>?,
    ));
  }
}

/// @nodoc
abstract class _$$_HpApiResponseCopyWith<$Res>
    implements $HpApiResponseCopyWith<$Res> {
  factory _$$_HpApiResponseCopyWith(
          _$_HpApiResponse value, $Res Function(_$_HpApiResponse) then) =
      __$$_HpApiResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int resultAvailable,
      int resultReturned,
      int resultStart,
      List<Shop>? shop});
}

/// @nodoc
class __$$_HpApiResponseCopyWithImpl<$Res>
    extends _$HpApiResponseCopyWithImpl<$Res>
    implements _$$_HpApiResponseCopyWith<$Res> {
  __$$_HpApiResponseCopyWithImpl(
      _$_HpApiResponse _value, $Res Function(_$_HpApiResponse) _then)
      : super(_value, (v) => _then(v as _$_HpApiResponse));

  @override
  _$_HpApiResponse get _value => super._value as _$_HpApiResponse;

  @override
  $Res call({
    Object? resultAvailable = freezed,
    Object? resultReturned = freezed,
    Object? resultStart = freezed,
    Object? shop = freezed,
  }) {
    return _then(_$_HpApiResponse(
      resultAvailable: resultAvailable == freezed
          ? _value.resultAvailable
          : resultAvailable // ignore: cast_nullable_to_non_nullable
              as int,
      resultReturned: resultReturned == freezed
          ? _value.resultReturned
          : resultReturned // ignore: cast_nullable_to_non_nullable
              as int,
      resultStart: resultStart == freezed
          ? _value.resultStart
          : resultStart // ignore: cast_nullable_to_non_nullable
              as int,
      shop: shop == freezed
          ? _value._shop
          : shop // ignore: cast_nullable_to_non_nullable
              as List<Shop>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HpApiResponse implements _HpApiResponse {
  _$_HpApiResponse(
      {required this.resultAvailable,
      required this.resultReturned,
      required this.resultStart,
      final List<Shop>? shop})
      : _shop = shop;

  factory _$_HpApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HpApiResponseFromJson(json);

  @override
  final int resultAvailable;
  @override
  final int resultReturned;
  @override
  final int resultStart;
  final List<Shop>? _shop;
  @override
  List<Shop>? get shop {
    final value = _shop;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HpApiResponse(resultAvailable: $resultAvailable, resultReturned: $resultReturned, resultStart: $resultStart, shop: $shop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HpApiResponse &&
            const DeepCollectionEquality()
                .equals(other.resultAvailable, resultAvailable) &&
            const DeepCollectionEquality()
                .equals(other.resultReturned, resultReturned) &&
            const DeepCollectionEquality()
                .equals(other.resultStart, resultStart) &&
            const DeepCollectionEquality().equals(other._shop, _shop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(resultAvailable),
      const DeepCollectionEquality().hash(resultReturned),
      const DeepCollectionEquality().hash(resultStart),
      const DeepCollectionEquality().hash(_shop));

  @JsonKey(ignore: true)
  @override
  _$$_HpApiResponseCopyWith<_$_HpApiResponse> get copyWith =>
      __$$_HpApiResponseCopyWithImpl<_$_HpApiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HpApiResponseToJson(
      this,
    );
  }
}

abstract class _HpApiResponse implements HpApiResponse {
  factory _HpApiResponse(
      {required final int resultAvailable,
      required final int resultReturned,
      required final int resultStart,
      final List<Shop>? shop}) = _$_HpApiResponse;

  factory _HpApiResponse.fromJson(Map<String, dynamic> json) =
      _$_HpApiResponse.fromJson;

  @override
  int get resultAvailable;
  @override
  int get resultReturned;
  @override
  int get resultStart;
  @override
  List<Shop>? get shop;
  @override
  @JsonKey(ignore: true)
  _$$_HpApiResponseCopyWith<_$_HpApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
