enum UserType { client, admin, superAdmin }

class UserModel {
  final String id;
  final String email;
  final String name;
  final String password;
  final UserType userType;

  const UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.userType});

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, password: $password, userType: $userType)';
  }
}
