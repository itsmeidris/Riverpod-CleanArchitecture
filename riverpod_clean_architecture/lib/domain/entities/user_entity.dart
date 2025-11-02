class UserEntity {
  final int id;
  final String profilePic;
  final String firstName;
  final String lastName;
  final String country;
  final String state;
  final String jobTitle;
  final String companyName;
  final String email;
  final String phone;

  UserEntity({
    required this.id,
    required this.profilePic,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.state,
    required this.jobTitle,
    required this.companyName,
    required this.email,
    required this.phone,
  });
}
