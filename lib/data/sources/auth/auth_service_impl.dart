import 'package:dartz/dartz.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/data/sources/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class AuthServiceImpl implements AuthService {
  @override
  Future<Either> signIn() {
    // TODO: implement signIn

    throw UnimplementedError();
  }


//TODO: today i should make an api that handles signup logic for the backend to test if my frontend is working

// TODO: today i should make an api that handles signin logic for the backend  to finish the authentication related things 
  @override
  Future<Either> signUp(CreateUser createUser) async {
    try {
      var url = Uri.http('10.12.74.43:5000', '/api/register');
      var response = await http.post(url, body: {
        // we need to pass the body in
        'email': createUser.email,
        'phone': createUser.phone,
        'compID': createUser.compID,
        'password': createUser.password,
      });

      // if the user was created successfully
      if (response.statusCode == 200) {
        // we will return a right with the user object
        return Right(createUser);
      } else {
        // if the user was not created successfully
        // we will return a left with the error message
        return Left('Error creating user');
      }
    } catch (e) {
      // if it fails we will return a left
      return Left(e.toString());
    }
  }
}
