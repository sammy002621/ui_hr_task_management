import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(id: '', email: '', token: ''));

  void setUser(String id, String email, String token) {
    emit(state.copyWith(id: id, email: email, token: token));
    print("CURRENT USER STATE IS _____________________________: ${state.email}-${state.id}-${state.token}");
    saveUserToPreferences(id, email, token);
  }

  void clearUser() {
    emit(UserState(id: '', email: '', token: ''));
    clearUserPreferences();
  }

  Future<void> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('user_id') ?? '';
    final email = prefs.getString('user_email') ?? '';
    final token = prefs.getString('user_token') ?? '';

    if (id.isNotEmpty && email.isNotEmpty && token.isNotEmpty) {
      emit(state.copyWith(id: id, email: email, token: token));
    }
    print('LOADED USER IS _____________________________ : ${state.email}-${state.id}-${state.token}');
  }

  Future<void> saveUserToPreferences(
      String id, String email, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', id);
    await prefs.setString('user_email', email);
    await prefs.setString('user_token', token);
  }

  Future<void> clearUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('user_email');
    await prefs.remove('user_token');
  }
}
