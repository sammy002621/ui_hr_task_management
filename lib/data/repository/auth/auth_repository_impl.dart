import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/models/send_otp.dart';
import 'package:workmate/data/models/sign_in_user.dart';
import 'package:workmate/data/sources/auth/auth_service.dart';
import 'package:workmate/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);
  @override
  Future<Either> signIn(SignInUser signinUser) async {
    return authService.signIn(signinUser);
  }

  @override
  Future<Either> signUp(CreateUser createUser) async {
    // call the service with signup
    return await authService.signUp(createUser);
  }
  
  @override
  Future<Either> createOtp(String email) async {
    return await authService.createOtp(email);
  }
}
