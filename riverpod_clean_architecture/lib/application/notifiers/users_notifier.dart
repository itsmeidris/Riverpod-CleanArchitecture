import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
import 'package:riverpod_clean_architecture/domain/usecases/get_user_data_use_case.dart';

//By using [AsyncValue], you are guaranteed that you cannot
//forget to handle the loading/error state of an async operation.
//[AsyncValue] is a sealed class, and is designed to be used with pattern matching to handle the different states.

class UsersNotifier extends StateNotifier<AsyncValue<List<UserEntity>>> {
  final GetUserDataUseCase _getUserDataUseCase;
  
  //Auto-fetch inside the Notifier constructor
  //The data is fetched automatically when the provider is first created.
  UsersNotifier(this._getUserDataUseCase) : super(const AsyncValue.loading()){
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    state = const AsyncValue.loading();
    try {
      final users = await _getUserDataUseCase();
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

