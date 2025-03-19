import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/models/send_otp.dart';

class SendOtpParams {
  final CreateUser createUser;
  final SendOtp sendOtp;

  SendOtpParams({required this.createUser, required this.sendOtp});
}
