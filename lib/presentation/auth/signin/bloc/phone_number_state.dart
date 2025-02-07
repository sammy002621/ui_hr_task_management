class PhoneNumberState {
  final String dialCode;
  PhoneNumberState({required this.dialCode});

  PhoneNumberState copyWith(String countryCode) {
    return PhoneNumberState(dialCode: countryCode);
  }
}
