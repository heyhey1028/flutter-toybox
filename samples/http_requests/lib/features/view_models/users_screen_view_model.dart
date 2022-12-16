import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';

final usersScreenViewModelProvider = StateNotifierProvider.autoDispose<
    UsersScreenViewModel,
    // ignore: unnecessary_lambdas
    AsyncValue<List<User>>>((ref) => UsersScreenViewModel(ref));

class UsersScreenViewModel extends StateNotifier<AsyncValue<List<User>>> {
  UsersScreenViewModel(this._ref) : super(const AsyncValue.loading()) {
    fetchData();
  }

  final Ref _ref;

  Future<void> fetchData() async {
    state = await AsyncValue.guard(
      () async => _ref.read(userRepositoryProvider).getAllUsers(),
    );
  }
}
