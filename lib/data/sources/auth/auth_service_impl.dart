import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/models/sign_in_user.dart';
import 'package:workmate/data/sources/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class AuthServiceImpl implements AuthService {
  @override
  Future<Either> signIn(SignInUser signinUser) async {
    try {
      var url = Uri.http('10.0.2.2:5500', 'workmate/v1/auth/sign-in');

      var response = await http.post(url, body: {
        'email': signinUser.email,
        'password': signinUser.password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            'USER LOGGED IN _________________________: ${response.body}');
      } else {
        return Left(
            'ERROR LOGGING IN USER ______________________________________: ${response.body}');
      }
    } catch (e) {
      return Left(e.toString());
    }

  }

// TODO: try to find a way that the phone number will also be validated like the others as long as nothing is in it or it is empty
  @override
  Future<Either> signUp(CreateUser createUser) async {
    try {
      var url = Uri.http('10.0.2.2:5500', 'workmate/v1/auth/sign-up');
      var response = await http.post(url, body: {
        // we need to pass the body in
        'email': createUser.email,
        'phone': createUser.phone,
        'compID': createUser.compID,
        'password': createUser.password,
      });

      // if the user was created successfully
      if (response.statusCode == 200 || response.statusCode == 201) {
        // we will return a right with the user object
        return Right(
            'USER CREATED SUCCESSFULLY_______________________ ${response.body}');
      } else {
        // if the user was not created successfully
        // we will return a left with the error message
        return Left(
            'ERROR CREATING USER:_____________________________ ${response.body}');
      }
    } catch (e) {
      // if it fails we will return a left
      return Left(e.toString());
    }
  }
}



