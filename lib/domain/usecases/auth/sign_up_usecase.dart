import 'package:dartz/dartz.dart';
import 'package:workmate/core/usecases/usecase.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/domain/repository/auth/auth_repository.dart';

class SignUpUsecase implements Usecase<Either,CreateUser> {
  final AuthRepository authRepository;

  SignUpUsecase(this.authRepository);
  @override
  Future<Either> call({CreateUser? params}) async {
    return await authRepository.signUp(params!);

  }
}