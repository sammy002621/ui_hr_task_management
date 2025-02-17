import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState(obscure1:true, obscure2: true, isSelected: false));
  // function to update the obscure property of our password field 
  void updateObscure1() {
    emit(state.copyWith(!state.obscure1,state.obscure2,state.isSelected));
  }
 // function to update the obscure property of the confirm password field
  void updateObscure2() {
    emit(state.copyWith(state.obscure1,!state.obscure2,state.isSelected));
  }

// function to update the isSelected property of the checkbox 
void updateIsSelected() {
    emit(state.copyWith(state.obscure1,state.obscure2,!state.isSelected));
  }

}


