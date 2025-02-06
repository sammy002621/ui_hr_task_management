import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState(obscure1:true, obscure2: true));

  void updateObscure1() {
    emit(state.copyWith(!state.obscure1,state.obscure2));
  }

  void updateObscure2() {
    emit(state.copyWith(state.obscure1,!state.obscure2));
  }
}


