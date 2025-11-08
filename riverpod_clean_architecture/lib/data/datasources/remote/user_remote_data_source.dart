import 'package:riverpod_clean_architecture/application/config/network/dio_client.dart';
import 'package:riverpod_clean_architecture/application/core/constants/api_endpoints.dart';
import 'package:riverpod_clean_architecture/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> fetchUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient;

  UserRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.users);
      final List<dynamic> data = response.data['users'];
      return data.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}

//✅ This class:

//Fetches users using the DioClient.
//Converts the response into a list of UserModel.
