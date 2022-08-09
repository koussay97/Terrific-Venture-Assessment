import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

import '../../../../fixtures/fixture-reader.dart';
import '../../../../mocks/mock-generator.mocks.dart';

main() {
  late MockSharedPreferences sharedPreferences;
  late AuthLocalDataSourceIMPL localDataSource;
  late String accessToken;
  late String refreshToken;
  late UserModel user;


  setUp(() {
    sharedPreferences = MockSharedPreferences();
    localDataSource =
        AuthLocalDataSourceIMPL(sharedPreferences: sharedPreferences);
    accessToken = 'access token';
    refreshToken = 'refresh token';
  });

  group('testing local data source service', () {
    setUp(() {
      // there is not much to test with cache service in this feature
      // therefore i took advantage of it to test the parsing ::model.fromJson()
      var data = json.decode(fixtureReader('login-fixture.json'));

      accessToken = data['token'];

      refreshToken = data['refreshToken'];

      // i thought that company json object was integrated with the user
      // however it turns out that it was in its separate object so i had to
      // pass it in the constructor to avoid repeating the whole architecture
      // of the loginUseCase()

      user = UserModel.fromJson(data['user'],
          CompanyModel.fromJson(data['company']));
    });

    test('should return a token from cache when exists', () async {
      // arrange
      when(sharedPreferences.containsKey(
        KeyStorage.accessToken.name,
      )).thenReturn(true);
      when(sharedPreferences.getString(
        KeyStorage.accessToken.name,
      )).thenReturn(accessToken);
      // act
      final result = await localDataSource.getAccessToken();
      // assert
      expect(result, accessToken);
    });

    test('should return a user model from cache when exists', () async {
      // arrange
      when(sharedPreferences.containsKey(
        KeyStorage.user.name,
      )).thenReturn(true);
      when(sharedPreferences.getString(
        KeyStorage.user.name,
      )).thenReturn(json.encode(UserModel.toJson(user)));
      // act
      final result = await localDataSource.getUser();
      // assert
      expect(result, UserModel.toJson(user));
    });

    test('should throw a CacheException if key does not exists', () async {
      // arrange
      when(sharedPreferences.containsKey(
        any,
      )).thenReturn(false);

      // act

      try {
        final result = await localDataSource.getUser();
      }catch(e){
      debugPrint(e.toString());
      }
      // assert
      expect(localDataSource.getUser(), throwsException);
    });

    test('should throw a CacheException if value is empty', () async {
      // arrange
      when(sharedPreferences.getString(
        any,
      )).thenReturn('');

      // act

      try {
        final result = await localDataSource.getUser();
      }catch(e){
        debugPrint(e.toString());
      }
      // assert
      expect(localDataSource.getUser(), throwsException);
    });
  });
}
