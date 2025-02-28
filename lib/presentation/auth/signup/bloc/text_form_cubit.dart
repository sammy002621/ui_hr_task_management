import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_state.dart';

class TextFormCubit extends Cubit<TextFormState> {
  TextFormCubit() : super(TextFormState());

  void updateEmailValid(bool value) {
    emit(state.copyWith(isEmailValid: value));
    _updateFormValid();
  }

  void updateCompanyIdValid(bool value) {
    emit(state.copyWith(isCompanyIdValid: value));
    _updateFormValid();
  }

  void updatePasswordValid(bool value) {
    emit(state.copyWith(isPasswordValid: value));
    _updateFormValid();
  }

  void updateConfirmPasswordValid(bool value) {
    emit(state.copyWith(isConfirmPasswordValid: value));
    _updateFormValid();
  }

  void updatePhoneNumberValid(bool value) {
    emit(state.copyWith(isPhoneNumberValid: value));
    _updateFormValid();
  }

  void _updateFormValid() {
    final isFormValid = state.isEmailValid &&
        state.isCompanyIdValid &&
        state.isPasswordValid &&
        state.isConfirmPasswordValid &&
        state.isPhoneNumberValid;
    emit(state.copyWith(isFormValid: isFormValid));
  }

  void startSubmitting() {
    emit(state.copyWith(isSubmitting: true, error: null));
  }

  void submissionComplete() {
    emit(state.copyWith(isSubmitting: false));
  }

  void setError(String error) {
    emit(state.copyWith(isSubmitting: false, error: error));
  }

  void reset() {
    emit(TextFormState());
  }
}
