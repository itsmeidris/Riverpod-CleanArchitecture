import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Inital;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(List<UserEntity> users) = _Success;
  const factory UserState.error(String message) = _Error;
}
