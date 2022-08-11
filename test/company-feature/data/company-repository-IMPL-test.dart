


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-1-repositories/company-repository-IMPL.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-2-models/comapny-model.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-3-data-sources/local-data-source/company-local-data-source.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';

import '../../mocks/mock-generator.mocks.dart';

main(){
late CompanyRepositoryIMPL repository;
late MockCompanyRemoteDataSource remoteDataSource;
late MockCompanyLocalDataSource localDataSource;
late MockNetworkInfo networkInfo;
late CompanyModel tCompany;

  setUp(() {
    remoteDataSource= MockCompanyRemoteDataSource();
    localDataSource = MockCompanyLocalDataSource();
    networkInfo= MockNetworkInfo();
    repository = CompanyRepositoryIMPL(
      networkInfo: networkInfo,
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );

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

  });
  group('testing company repository IMPL', () {

    test('should check if network connection is called ', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.getCompany())
          .thenAnswer((realInvocation) async => tCompany);

      // act
      repository.getCompany();
      // assert
      verify(networkInfo.isConnected);
    });



    test('should cache company when gotten successfully and return Company model', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.getCompany())
          .thenAnswer((realInvocation) async => tCompany);

      // act
      var result = await repository.getCompany();
      // assert
      expect(tCompany,isA<UserCompany>()); // verify that userModel is automatically castable to user entity
      expect(result, Right(tCompany));
      verify(localDataSource.setCompany(CompanyKeys.company, CompanyModel.toJson(tCompany)));
      verifyNoMoreInteractions(localDataSource);
    });



    test('should return server failure if get fails', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(remoteDataSource.getCompany())
          .thenThrow((realInvocation) async => ServerExceptions());

      // act
      var result = await repository.getCompany();
      // assert

      expect(result, const Left(ServerFailures(properties: [])));
      verify(remoteDataSource.getCompany());
      verifyNoMoreInteractions(localDataSource);
    });

    test('should return cached Company on network failure if found in local storage', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async=> false);

      when(localDataSource.getCompany(CompanyKeys.company)).thenAnswer((realInvocation) async=> tCompany);

      // act
      var result = await repository.getCompany();
      // assert
      expect(result, Right(tCompany));
      expect(tCompany, isA<UserCompany>());
      verify(localDataSource.getCompany(CompanyKeys.company));
      verifyNever(remoteDataSource.getCompany());
      verifyNoMoreInteractions(localDataSource);
    });

    test('should return CacheFailure if no Company found in local storage', () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((realInvocation) async=> false);

      when(localDataSource.getCompany(CompanyKeys.company)).thenThrow(CacheExceptions('message', 'stackTrace'));

      // act
      var result = await repository.getCompany();
      // assert
      expect(result, const Left(CacheFailures(properties: [])));
      verify(localDataSource.getCompany(CompanyKeys.company));
      verifyNever(remoteDataSource.getCompany());
      verifyNoMoreInteractions(localDataSource);
    });


  });

}