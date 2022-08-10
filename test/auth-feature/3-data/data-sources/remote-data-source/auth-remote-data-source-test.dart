import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/remote-data-source/auth-remote-data-source.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';

import '../../../../fixtures/fixture-reader.dart';
import '../../../../mocks/mock-generator.mocks.dart';

main() {
late AuthRemoteDataSourceIMPL remoteDataSource;
late MockAuthLocalDataSource localDataSource;
late MockDio dio;
late UserModel user;
late dynamic data;
late Response response;
late dynamic req;
late RequestOptions requestOptions;
LoginInterceptor interceptor;
late String loginData;
// don't run this test still needs work
  setUpAll(() async{
    localDataSource = MockAuthLocalDataSource();
    dio= MockDio();
    interceptor = LoginInterceptor(localDataSource: localDataSource);
    remoteDataSource = AuthRemoteDataSourceIMPL(localDataSource: localDataSource,dio: dio,interceptor: interceptor);

    data = json.decode(fixtureReader('login-fixture.json'));
     loginData =json.encode( {
      'phoneNumber':'phoneNumber',
      'otp':123
    });
    //req = dio.request('http://142.93.112.93:3000/auth/login/verify',data:loginData,options: Options(method: 'post',) );
   // requestOptions= req.requestOptions;

   // response= Response(statusCode: 200,data: data,requestOptions:requestOptions );

    user = UserModel.fromJson(data['user'],
        CompanyModel.fromJson(data['company']));
  });

  group('testing authRemoteDataSource', () {

    test('should cache data locally on status code 200 + return userModel',
        () async {
        // arrange
        when(remoteDataSource.dioInstance.post(any,data: loginData)).thenAnswer((invocation) async {
         // debugPrint('${invocation.memberName}----- hi');
          return Response(
            statusCode: 200,
            data: data,
              requestOptions: RequestOptions(path: 'http://142.93.112.93:3000/auth/login/verify'));
            });


        // act

        var result = await remoteDataSource.login('phoneNumber', 123);
        // assert

          verify(localDataSource.setUser(KeyStorage.user, any));
          verify(localDataSource.setTokens(KeyStorage.accessToken, any));
          verify(localDataSource.setTokens(KeyStorage.refreshToken, any));
          expect(result, user);
        });

    test('should throw server Exception whenever status code =! 200',
            () async {
          // arrange

          // act

          // assert

        });

  });
}
