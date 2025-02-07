import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberState(dialCode: '+91'));

  // method to change the current country dial code
  void changeDialCode(String dialCode) {
    emit(state.copyWith(dialCode));
    print('CURRENT STATE DIAL CODE IS ________: ${state.dialCode}');
  }
}
