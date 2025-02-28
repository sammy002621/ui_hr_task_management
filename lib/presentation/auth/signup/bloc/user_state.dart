// what will be the state of the user when the user is authenticated

class UserState {
  final String id;
  final String email;

  UserState({required this.id, required this.email});

  UserState copyWith({String? id, String? email}) {
    return UserState(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
