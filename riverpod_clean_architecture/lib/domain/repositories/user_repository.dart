//Later, the data layer will implement this (UserRepositoryImpl) and call the API via Dio.
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
