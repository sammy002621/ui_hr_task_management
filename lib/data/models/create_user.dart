class CreateUser {
  final String email;
  final String phone;
  final String compID;
  final String password;

  CreateUser({required this.email, required this.password, required this.compID, required this.phone});

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //   };
  // }
}
