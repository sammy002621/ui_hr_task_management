import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_state.dart';

class TextFormCubit extends Cubit<TextFormState> {
  TextFormCubit() : super((TextFormState(isFormValid: false)));

  // function to update the isFormValid variable

  void updateIsFormValid(bool value) {
    emit(state.copyWith(value));
  }
}
