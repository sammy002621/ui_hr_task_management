class TextFormState {
  final bool isEmailValid;
  final bool isCompanyIdValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isPhoneNumberValid;
  final bool isFormValid;
  final bool isSubmitting;
  final Object? error;

  TextFormState({
    this.isEmailValid = false,
    this.isCompanyIdValid = false,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
    this.isPhoneNumberValid = false,
    this.isFormValid = false,
    this.isSubmitting = false,
    this.error,
  });

  TextFormState copyWith({
    bool? isEmailValid,
    bool? isCompanyIdValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isPhoneNumberValid,
    bool? isFormValid,
    bool? isSubmitting,
    Object? error,
  }) {
    return TextFormState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isCompanyIdValid: isCompanyIdValid ?? this.isCompanyIdValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      isFormValid: isFormValid ?? this.isFormValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error ?? this.error,
    );
  }
}
