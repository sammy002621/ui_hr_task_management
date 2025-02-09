class TextFormState {
  final bool isFormValid;

  TextFormState({required this.isFormValid});

  TextFormState copyWith(bool? value) {
    return TextFormState(isFormValid: value ?? isFormValid);
  }
}
