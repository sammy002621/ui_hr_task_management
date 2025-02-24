import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';

abstract class AuthRepository {
  Future<Either> signIn();
  Future<Either> signUp(CreateUser createUser);
}
