// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$Shop {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logoImageUrl => throw _privateConstructorUsedError;
  String get nameKana => throw _privateConstructorUsedError;
  int get lat => throw _privateConstructorUsedError;
  int get lng => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get open => throw _privateConstructorUsedError;
  DateTime get close => throw _privateConstructorUsedError;
  Photo get photoUrl => throw _privateConstructorUsedError;
  Urls get urls => throw _privateConstructorUsedError;
  Genre get genre => throw _privateConstructorUsedError;
  Genre get subGenre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCopyWith<Shop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCopyWith<$Res> {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) then) =
      _$ShopCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String logoImageUrl,
      String nameKana,
      int lat,
      int lng,
      int capacity,
      String open,
      DateTime close,
      Photo photoUrl,
      Urls urls,
      Genre genre,
      Genre subGenre});

  $PhotoCopyWith<$Res> get photoUrl;
  $UrlsCopyWith<$Res> get urls;
  $GenreCopyWith<$Res> get genre;
  $GenreCopyWith<$Res> get subGenre;
}

/// @nodoc
class _$ShopCopyWithImpl<$Res> implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._value, this._then);

  final Shop _value;
  // ignore: unused_field
  final $Res Function(Shop) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logoImageUrl = freezed,
    Object? nameKana = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? capacity = freezed,
    Object? open = freezed,
    Object? close = freezed,
    Object? photoUrl = freezed,
    Object? urls = freezed,
    Object? genre = freezed,
    Object? subGenre = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoImageUrl: logoImageUrl == freezed
          ? _value.logoImageUrl
          : logoImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: nameKana == freezed
          ? _value.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as int,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as int,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      open: open == freezed
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: close == freezed
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Photo,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Urls,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      subGenre: subGenre == freezed
          ? _value.subGenre
          : subGenre // ignore: cast_nullable_to_non_nullable
              as Genre,
    ));
  }

  @override
  $PhotoCopyWith<$Res> get photoUrl {
    return $PhotoCopyWith<$Res>(_value.photoUrl, (value) {
      return _then(_value.copyWith(photoUrl: value));
    });
  }

  @override
  $UrlsCopyWith<$Res> get urls {
    return $UrlsCopyWith<$Res>(_value.urls, (value) {
      return _then(_value.copyWith(urls: value));
    });
  }

  @override
  $GenreCopyWith<$Res> get genre {
    return $GenreCopyWith<$Res>(_value.genre, (value) {
      return _then(_value.copyWith(genre: value));
    });
  }

  @override
  $GenreCopyWith<$Res> get subGenre {
    return $GenreCopyWith<$Res>(_value.subGenre, (value) {
      return _then(_value.copyWith(subGenre: value));
    });
  }
}

/// @nodoc
abstract class _$$_ShopCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$$_ShopCopyWith(_$_Shop value, $Res Function(_$_Shop) then) =
      __$$_ShopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String logoImageUrl,
      String nameKana,
      int lat,
      int lng,
      int capacity,
      String open,
      DateTime close,
      Photo photoUrl,
      Urls urls,
      Genre genre,
      Genre subGenre});

  @override
  $PhotoCopyWith<$Res> get photoUrl;
  @override
  $UrlsCopyWith<$Res> get urls;
  @override
  $GenreCopyWith<$Res> get genre;
  @override
  $GenreCopyWith<$Res> get subGenre;
}

/// @nodoc
class __$$_ShopCopyWithImpl<$Res> extends _$ShopCopyWithImpl<$Res>
    implements _$$_ShopCopyWith<$Res> {
  __$$_ShopCopyWithImpl(_$_Shop _value, $Res Function(_$_Shop) _then)
      : super(_value, (v) => _then(v as _$_Shop));

  @override
  _$_Shop get _value => super._value as _$_Shop;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logoImageUrl = freezed,
    Object? nameKana = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? capacity = freezed,
    Object? open = freezed,
    Object? close = freezed,
    Object? photoUrl = freezed,
    Object? urls = freezed,
    Object? genre = freezed,
    Object? subGenre = freezed,
  }) {
    return _then(_$_Shop(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoImageUrl: logoImageUrl == freezed
          ? _value.logoImageUrl
          : logoImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: nameKana == freezed
          ? _value.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as int,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as int,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      open: open == freezed
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as String,
      close: close == freezed
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Photo,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Urls,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      subGenre: subGenre == freezed
          ? _value.subGenre
          : subGenre // ignore: cast_nullable_to_non_nullable
              as Genre,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shop implements _Shop {
  _$_Shop(
      {required this.id,
      required this.name,
      required this.logoImageUrl,
      required this.nameKana,
      required this.lat,
      required this.lng,
      required this.capacity,
      required this.open,
      required this.close,
      required this.photoUrl,
      required this.urls,
      required this.genre,
      required this.subGenre});

  factory _$_Shop.fromJson(Map<String, dynamic> json) => _$$_ShopFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String logoImageUrl;
  @override
  final String nameKana;
  @override
  final int lat;
  @override
  final int lng;
  @override
  final int capacity;
  @override
  final String open;
  @override
  final DateTime close;
  @override
  final Photo photoUrl;
  @override
  final Urls urls;
  @override
  final Genre genre;
  @override
  final Genre subGenre;

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, logoImageUrl: $logoImageUrl, nameKana: $nameKana, lat: $lat, lng: $lng, capacity: $capacity, open: $open, close: $close, photoUrl: $photoUrl, urls: $urls, genre: $genre, subGenre: $subGenre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shop &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.logoImageUrl, logoImageUrl) &&
            const DeepCollectionEquality().equals(other.nameKana, nameKana) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
            const DeepCollectionEquality().equals(other.open, open) &&
            const DeepCollectionEquality().equals(other.close, close) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality().equals(other.urls, urls) &&
            const DeepCollectionEquality().equals(other.genre, genre) &&
            const DeepCollectionEquality().equals(other.subGenre, subGenre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logoImageUrl),
      const DeepCollectionEquality().hash(nameKana),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(capacity),
      const DeepCollectionEquality().hash(open),
      const DeepCollectionEquality().hash(close),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(urls),
      const DeepCollectionEquality().hash(genre),
      const DeepCollectionEquality().hash(subGenre));

  @JsonKey(ignore: true)
  @override
  _$$_ShopCopyWith<_$_Shop> get copyWith =>
      __$$_ShopCopyWithImpl<_$_Shop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopToJson(
      this,
    );
  }
}

abstract class _Shop implements Shop {
  factory _Shop(
      {required final String id,
      required final String name,
      required final String logoImageUrl,
      required final String nameKana,
      required final int lat,
      required final int lng,
      required final int capacity,
      required final String open,
      required final DateTime close,
      required final Photo photoUrl,
      required final Urls urls,
      required final Genre genre,
      required final Genre subGenre}) = _$_Shop;

  factory _Shop.fromJson(Map<String, dynamic> json) = _$_Shop.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get logoImageUrl;
  @override
  String get nameKana;
  @override
  int get lat;
  @override
  int get lng;
  @override
  int get capacity;
  @override
  String get open;
  @override
  DateTime get close;
  @override
  Photo get photoUrl;
  @override
  Urls get urls;
  @override
  Genre get genre;
  @override
  Genre get subGenre;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCopyWith<_$_Shop> get copyWith => throw _privateConstructorUsedError;
}
