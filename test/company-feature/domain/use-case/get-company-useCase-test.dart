import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-2-use-cases/get-company-use-case.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/base-use-case.dart';

import '../../../mocks/mock-generator.mocks.dart';

main() {
  late MockCompanyRepository repository;
  late UserCompany tCompany;
  late GetCompanyUseCase useCase;
  setUp(() {
    repository = MockCompanyRepository();

    useCase = GetCompanyUseCase(companyRepository: repository);

    tCompany = const UserCompany(
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

  group('Testing get company use case', () {
    test('should get company entity on success ', () async {
      // arrange
      when(repository.getCompany())
          .thenAnswer((_) async => Right(tCompany));
      // act
      final result = await useCase(Params.nullParams());
      // assert
      expect(result, equals(Right(tCompany)));
     // expect(result, Right(tCompany));

      verify(repository.getCompany());
      verifyNoMoreInteractions(repository);
    });

    test('should get Failure on fail ', () async {
      // arrange
      when(repository.getCompany())
          .thenAnswer((_) async => const Left(ServerFailures(properties: '')));
      // act
      final result = await useCase(Params.nullParams());
      // assert
      expect(result, equals(const Left(ServerFailures(properties: ''))));
      // expect(result, Right(tCompany));

      verify(repository.getCompany());
      verifyNoMoreInteractions(repository);
    });
  });
}
