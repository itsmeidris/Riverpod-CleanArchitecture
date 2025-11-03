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

  @override
  String toString() {
    return 'UserEntity(id: $id, profilePic: $profilePic, firstName: $firstName, lastName: $lastName, country: $country, state: $state, jobTitle: $jobTitle, companyName: $companyName, email: $email, phone: $phone)';
  }
}
