// Step 1: provide UserRemoteDataSource
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_clean_architecture/presentation/notifiers/controllers/users_controller.dart';
import 'package:riverpod_clean_architecture/presentation/notifiers/providers/dio/dio_provider.dart';
import 'package:riverpod_clean_architecture/data/datasources/remote/user_remote_data_source.dart';
import 'package:riverpod_clean_architecture/data/repositories/user_repository_impl.dart';
import 'package:riverpod_clean_architecture/domain/usecases/get_user_data_use_case.dart';
import 'package:riverpod_clean_architecture/presentation/notifiers/states/user/user_state.dart';

// Step 1: provide UserRemoteDataSource (DATASOURCE)
final usersRemoteDataSourceProvider = Provider<UserRemoteDataSourceImpl>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return UserRemoteDataSourceImpl(dioClient);
});

// Step 2: provide UserRepositoryImpl (REPOSITORY IMPL)
final usersRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(usersRemoteDataSourceProvider);
  return UserRepositoryImpl(remoteDataSource);
});

//Step 3: provide GetUsersUseCase
final getUsersUseCaseProvider = Provider<GetUserDataUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return GetUserDataUseCase(repository);
});

// Step 4: provider for notifier
final usersNotifiersProvider =
    StateNotifierProvider<UsersController ,UserState>((ref) {
      final useCase = ref.watch(getUsersUseCaseProvider);
      return UsersController(useCase);
    });
