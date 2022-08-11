
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';

import '../../3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

import '../local-data-source/auth-local-data-source.dart';

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
  Dio dio;
  Interceptor interceptor;
  AuthLocalDataSource localDataSource;
  AuthRemoteDataSourceIMPL({required this.dio,required this.interceptor,required this.localDataSource});
static String endpoint='http://142.93.112.93:3000';

 get dioInstance{
   dio.interceptors.clear();
   dio.interceptors.add(interceptor);
   return dio;
 }
  @override
  Future<void> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String phoneNumber, int otp)async {

   var data =json.encode( {
     'phoneNumber':'+21693252427',//phoneNumber,
     'otp':'123456',//otp
   });
    var result = await dioInstance.post('$endpoint/auth/login/verify',data: data,);
    try {
      return UserModel.fromJson(
          result.data['user'], CompanyModel.fromJson(result.data['company']));
    }catch(e){
      throw ServerExceptions();
    }
 }

}
class LoginInterceptor extends Interceptor{

  AuthLocalDataSource localDataSource;
  LoginInterceptor({required this.localDataSource});


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
  //--- wait todo :: implement request retry option on SocketException
    throw UnimplementedError();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
  if(response.statusCode==200){
    localDataSource.setTokens(KeyStorage.accessToken, response.data['token']);
    localDataSource.setTokens(KeyStorage.refreshToken, response.data['refreshToken']);
    localDataSource.setUser(KeyStorage.user, response.data['user']+response.data['company']);
  handler.resolve(response);
  }
  throw ServerExceptions();
  }
}