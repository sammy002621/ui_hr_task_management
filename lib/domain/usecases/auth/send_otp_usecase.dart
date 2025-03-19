import 'package:dartz/dartz.dart';
import 'package:workmate/core/usecases/usecase.dart';
import 'package:workmate/domain/repository/auth/auth_repository.dart';


class SendOtpUsecase implements Usecase<Either, String> {
  final AuthRepository authRepository;
  SendOtpUsecase(this.authRepository);
  @override
  Future<Either> call({String? params}) async {
    return await authRepository.createOtp(params!);
  }
}
