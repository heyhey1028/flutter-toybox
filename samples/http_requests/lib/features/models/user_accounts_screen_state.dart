import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_requests/features/models/account.dart';
import 'package:http_requests/features/models/user.dart';

part 'user_accounts_screen_state.freezed.dart';

@freezed
class UserAccountsScreenState with _$UserAccountsScreenState {
  factory UserAccountsScreenState({
    User? user,
    @Default(0) int totalBalance,
    @Default(<Account>[]) List<Account> accounts,
  }) = _UserAccountsScreenState;
}
