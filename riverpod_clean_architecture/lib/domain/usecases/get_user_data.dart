import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
import 'package:riverpod_clean_architecture/domain/repositories/user_repository.dart';

//Your presentation layer (Riverpod controller) will only depend on this use case, not directly on the repository or API.
//It keeps business logic consistent and testable.

class GetUserData {
  final UserRepository _repository;
  GetUserData(this._repository);

  //Lets you use the class instance like a function. 
  //Common in use cases for cleaner syntax.
  Future<List<UserEntity>> call() async{
    return await _repository.getUsers();
  }
}
