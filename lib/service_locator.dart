import 'package:get_it/get_it.dart';
import 'package:workmate/data/repository/auth/auth_repository_impl.dart';
import 'package:workmate/data/sources/auth/auth_service.dart';
import 'package:workmate/data/sources/auth/auth_service_impl.dart';
import 'package:workmate/domain/repository/auth/auth_repository.dart';
import 'package:workmate/domain/usecases/auth/send_otp_usecase.dart';
import 'package:workmate/domain/usecases/auth/sign_up_usecase.dart';

GetIt sl = GetIt.instance;

// for registering dependencies and their implementations
Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(sl()));
  sl.registerLazySingleton(() => SendOtpUsecase(sl()));
}
