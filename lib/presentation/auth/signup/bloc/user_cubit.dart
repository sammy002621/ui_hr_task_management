import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(id: '', email: ''));

  void setUser(String id,  String email) {
    emit(state.copyWith(id: id, email: email));
  }
}