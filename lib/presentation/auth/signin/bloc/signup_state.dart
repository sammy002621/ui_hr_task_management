class SignupState {
  final bool obscure1;
  final bool obscure2;
  final bool isSelected;

  SignupState({
    required this.obscure1,
    required this.obscure2,
    required this.isSelected,
  });

  SignupState copyWith(bool? obscure1, bool? obscure2,bool? isSelected) {
    return SignupState(
        obscure1: obscure1 ?? this.obscure1,
        obscure2: obscure2 ?? this.obscure2,
        isSelected: isSelected ?? this.isSelected,
        );
  }
}
