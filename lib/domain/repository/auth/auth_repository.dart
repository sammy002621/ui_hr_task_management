import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/models/sign_in_user.dart';

abstract class AuthRepository {
  Future<Either> signIn(SignInUser signinUser);
  Future<Either> signUp(CreateUser createUser);
}
