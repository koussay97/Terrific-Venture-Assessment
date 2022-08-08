
import '../../3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

// interface

abstract class AuthRemoteDataSource {
  /*-----------------Auth Remotely-------------------*/

  /// on any [Exception] throws a [ServerExceptions]
  Future<UserModel> login(String phoneNumber, int otp);

  /// on any [Exception] throws a [ServerExceptions]
  Future<void> getRefreshToken();

}

// implementation

class AuthRemoteDataSourceIMPL implements AuthRemoteDataSource{
  @override
  Future<void> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String phoneNumber, int otp) {
    // TODO: implement login
    throw UnimplementedError();
  }

}