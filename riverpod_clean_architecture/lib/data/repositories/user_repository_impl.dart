import 'package:riverpod_clean_architecture/data/datasources/remote/user_remote_data_source.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
import 'package:riverpod_clean_architecture/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final users = await _remoteDataSource.fetchUsers();
      return users.map((user) => user.toUserEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}

//Decides whether to fetch from remote or local data source
//Convert to Entity class so the app can use it
//Handles errors and converts them to domain-friendly formats
