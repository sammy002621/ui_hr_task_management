import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/sources/auth/auth_service.dart';
import 'package:workmate/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);
  @override
  Future<Either> signIn() {
    // TODO:impelement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUser createUser) async {
    // call the service with signup
    return await authService.signUp(createUser);
  }
}