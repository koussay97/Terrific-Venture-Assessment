import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.1-repository/auth-repository-IMPL.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import '../../../mocks/mock-generator.mocks.dart';

main() {
  late AuthRepositoryIMPL repository;
  late MockAuthRemoteDataSource remoteDataSource;
  late MockAuthLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;
  late UserModel user;
  late CompanyModel tCompany;
  late String validLoginNumber;
  late int validLoginOtp;
  late String accessToken;
  late String refreshToken;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    localDataSource = MockAuthLocalDataSource();
    networkInfo = MockNetworkInfo();

    accessToken='access';
    refreshToken= 'refresh';

    repository = AuthRepositoryIMPL(
        localDataSource: localDataSource,
        networkInfo: networkInfo,
        remoteDataSource: remoteDataSource);

    validLoginOtp = 123456;
    validLoginNumber = '+21632154';


    tCompany = const CompanyModel(
      phoneNumber: '+21655543440',
      name: 'terrific Ventures',
      isArchived: false,
      id: 's56d4f6sd4f',
      commercialLicence: 'commercialLicence.jpeg',
      companyAdminName: ['ali'],
      contactEmail: 'hi@mail.com',
      internalComment: 'internalComment.jpeg',
      location: 'Habib Karwi street, Manzah19',
      logo: 'logo.jpeg',
      telephone: '+21697999000',
      vatNumber: 'vatNumber.jpeg',
    );

    user = UserModel(
      company: tCompany,
      id: '2131qfdg5s4f',
      isApproved: true,
      isArchived: false,
      name: 'Ali',
      phoneNumber: '+21655543440',
      profilePicture: 'picture.jpeg',
      role: 'admin',
    );
  });

  group('testing AuthRepositoryImpl', () {

    test('should check if network connection is called ', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.login(validLoginNumber, validLoginOtp))
          .thenAnswer((realInvocation) async => user);

      // act
      repository.login(number: validLoginNumber, otp: validLoginOtp);
      // assert
      verify(networkInfo.isConnected);
    });



    test('${1}should cache user data when login success and return user model', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.login(validLoginNumber, validLoginOtp))
          .thenAnswer((realInvocation) async => user);

      // act
      var result = await repository.login(number: validLoginNumber, otp: validLoginOtp);
      // assert
      expect(user,isA<User>()); // verify that userModel is automatically castable to user entity
      expect(result, Right(user));
      verify(localDataSource.setUser(KeyStorage.user, UserModel.toJson(user)));
      verifyNoMoreInteractions(localDataSource);
    });



    test('${2}should return server failure if login fails', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.login(validLoginNumber, validLoginOtp))
          .thenThrow((realInvocation) async => ServerExceptions());

      // act
      var result = await repository.login(number: validLoginNumber, otp: validLoginOtp);
      // assert

      expect(result, const Left(ServerFailures(properties: ['login cardinals are not correct'])));
      verify(remoteDataSource.login(validLoginNumber, validLoginOtp));
      verifyNoMoreInteractions(localDataSource);
    });



    test('${3}should return server failure if device offline', ()async{
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => false);
      // act
      var result = await repository.login(number: validLoginNumber, otp: validLoginOtp);
      // assert
      expect(result.isLeft(),true);
      expect(result,const Left(ServerFailures(properties: ['you lost internet connection please verify your network'])));

      verifyNever(remoteDataSource.login(validLoginNumber, validLoginOtp));
      verifyNever(localDataSource.setUser(KeyStorage.user, UserModel.toJson(user)));
      verifyNever(localDataSource.setTokens(KeyStorage.refreshToken, refreshToken));
      verifyNever(localDataSource.setTokens(KeyStorage.accessToken, accessToken));
    });
  });

  test('${4}should return logout message and delete tokens when logout called', () async {
    // arrange

    when(localDataSource.getAccessToken())
        .thenAnswer((realInvocation) async => accessToken);
    when(localDataSource.clearCollection(KeyStorage.accessToken))
        .thenAnswer((realInvocation) async => 'logOut success');

    // act
    var result = await repository.logOut();
    // assert

    expect(result, const Right('logOut success'));
    verify(localDataSource.getAccessToken());
    verify(localDataSource.clearCollection(KeyStorage.accessToken));
    verifyNoMoreInteractions(localDataSource);
  });

  test('${5}should return cache failure if no access token found', () async {
    // arrange

    when(localDataSource.clearCollection(KeyStorage.accessToken))
        .thenThrow((realInvocation) async => CacheExceptions('no token', 'stackTrace') );
    when(localDataSource.getAccessToken())
        .thenThrow((realInvocation) async => CacheExceptions('no token', 'stackTrace') );
    // act
    var result = await repository.logOut();
    // assert

    expect(result, const Left(CacheFailures(properties: 'no Token Found')));
    verify(localDataSource.getAccessToken());
    verifyNever(localDataSource.clearCollection(KeyStorage.accessToken));
    verifyNoMoreInteractions(localDataSource);
  });

}
