// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_accounts_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserAccountsScreenState {
  User? get user => throw _privateConstructorUsedError;
  int get totalBalance => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAccountsScreenStateCopyWith<UserAccountsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountsScreenStateCopyWith<$Res> {
  factory $UserAccountsScreenStateCopyWith(UserAccountsScreenState value,
          $Res Function(UserAccountsScreenState) then) =
      _$UserAccountsScreenStateCopyWithImpl<$Res, UserAccountsScreenState>;
  @useResult
  $Res call({User? user, int totalBalance, List<Account> accounts});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserAccountsScreenStateCopyWithImpl<$Res,
        $Val extends UserAccountsScreenState>
    implements $UserAccountsScreenStateCopyWith<$Res> {
  _$UserAccountsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserAccountsScreenStateCopyWith<$Res>
    implements $UserAccountsScreenStateCopyWith<$Res> {
  factory _$$_UserAccountsScreenStateCopyWith(_$_UserAccountsScreenState value,
          $Res Function(_$_UserAccountsScreenState) then) =
      __$$_UserAccountsScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, int totalBalance, List<Account> accounts});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_UserAccountsScreenStateCopyWithImpl<$Res>
    extends _$UserAccountsScreenStateCopyWithImpl<$Res,
        _$_UserAccountsScreenState>
    implements _$$_UserAccountsScreenStateCopyWith<$Res> {
  __$$_UserAccountsScreenStateCopyWithImpl(_$_UserAccountsScreenState _value,
      $Res Function(_$_UserAccountsScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_$_UserAccountsScreenState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc

class _$_UserAccountsScreenState implements _UserAccountsScreenState {
  _$_UserAccountsScreenState(
      {this.user,
      this.totalBalance = 0,
      final List<Account> accounts = const <Account>[]})
      : _accounts = accounts;

  @override
  final User? user;
  @override
  @JsonKey()
  final int totalBalance;
  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'UserAccountsScreenState(user: $user, totalBalance: $totalBalance, accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccountsScreenState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, totalBalance,
      const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAccountsScreenStateCopyWith<_$_UserAccountsScreenState>
      get copyWith =>
          __$$_UserAccountsScreenStateCopyWithImpl<_$_UserAccountsScreenState>(
              this, _$identity);
}

abstract class _UserAccountsScreenState implements UserAccountsScreenState {
  factory _UserAccountsScreenState(
      {final User? user,
      final int totalBalance,
      final List<Account> accounts}) = _$_UserAccountsScreenState;

  @override
  User? get user;
  @override
  int get totalBalance;
  @override
  List<Account> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccountsScreenStateCopyWith<_$_UserAccountsScreenState>
      get copyWith => throw _privateConstructorUsedError;
}
