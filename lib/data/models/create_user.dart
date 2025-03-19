class CreateUser {
  final String email;
  final String phone;
  final String compID;
  final String password;
  final String otp;

  CreateUser(
      {required this.email,
      required this.password,
      required this.compID,
      required this.phone,
      required this.otp
      });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //   };
  // }
}
