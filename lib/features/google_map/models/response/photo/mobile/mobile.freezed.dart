// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mobile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mobile _$MobileFromJson(Map<String, dynamic> json) {
  return _Mobile.fromJson(json);
}

/// @nodoc
mixin _$Mobile {
  String get l => throw _privateConstructorUsedError;
  String get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobileCopyWith<Mobile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileCopyWith<$Res> {
  factory $MobileCopyWith(Mobile value, $Res Function(Mobile) then) =
      _$MobileCopyWithImpl<$Res>;
  $Res call({String l, String s});
}

/// @nodoc
class _$MobileCopyWithImpl<$Res> implements $MobileCopyWith<$Res> {
  _$MobileCopyWithImpl(this._value, this._then);

  final Mobile _value;
  // ignore: unused_field
  final $Res Function(Mobile) _then;

  @override
  $Res call({
    Object? l = freezed,
    Object? s = freezed,
  }) {
    return _then(_value.copyWith(
      l: l == freezed
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MobileCopyWith<$Res> implements $MobileCopyWith<$Res> {
  factory _$$_MobileCopyWith(_$_Mobile value, $Res Function(_$_Mobile) then) =
      __$$_MobileCopyWithImpl<$Res>;
  @override
  $Res call({String l, String s});
}

/// @nodoc
class __$$_MobileCopyWithImpl<$Res> extends _$MobileCopyWithImpl<$Res>
    implements _$$_MobileCopyWith<$Res> {
  __$$_MobileCopyWithImpl(_$_Mobile _value, $Res Function(_$_Mobile) _then)
      : super(_value, (v) => _then(v as _$_Mobile));

  @override
  _$_Mobile get _value => super._value as _$_Mobile;

  @override
  $Res call({
    Object? l = freezed,
    Object? s = freezed,
  }) {
    return _then(_$_Mobile(
      l: l == freezed
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mobile implements _Mobile {
  _$_Mobile({required this.l, required this.s});

  factory _$_Mobile.fromJson(Map<String, dynamic> json) =>
      _$$_MobileFromJson(json);

  @override
  final String l;
  @override
  final String s;

  @override
  String toString() {
    return 'Mobile(l: $l, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mobile &&
            const DeepCollectionEquality().equals(other.l, l) &&
            const DeepCollectionEquality().equals(other.s, s));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(l),
      const DeepCollectionEquality().hash(s));

  @JsonKey(ignore: true)
  @override
  _$$_MobileCopyWith<_$_Mobile> get copyWith =>
      __$$_MobileCopyWithImpl<_$_Mobile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MobileToJson(
      this,
    );
  }
}

abstract class _Mobile implements Mobile {
  factory _Mobile({required final String l, required final String s}) =
      _$_Mobile;

  factory _Mobile.fromJson(Map<String, dynamic> json) = _$_Mobile.fromJson;

  @override
  String get l;
  @override
  String get s;
  @override
  @JsonKey(ignore: true)
  _$$_MobileCopyWith<_$_Mobile> get copyWith =>
      throw _privateConstructorUsedError;
}
