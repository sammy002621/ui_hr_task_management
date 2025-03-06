// what will be the state of the user when the user is authenticated

class UserState {
  final String id;
  final String email;
  final String token;

  UserState({required this.id, required this.email, required this.token});

  UserState copyWith({String? id, String? email, String? token}) {
    return UserState(
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }
}
