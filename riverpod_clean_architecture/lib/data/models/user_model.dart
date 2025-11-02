import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String image,
    required AddressModel address,
    required CompanyModel company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  //CONVERT TO ENTITY CLASS
  UserEntity toUserEntity() {
    return UserEntity(
      id: id,
      profilePic: image,
      firstName: firstName,
      lastName: lastName,
      country: address.country,
      state: address.state,
      jobTitle: company.title,
      companyName: company.name,
      email: email,
      phone: phone,
    );
  }
}

//NESTED ADDRESS MODEL
@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String address,
    required String city,
    required String state,
    required String country,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

//NESTED COMPANY CLASS
@freezed
abstract class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String department,
    required String name,
    required String title,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
}
