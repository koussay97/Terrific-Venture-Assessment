import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.2-use-cases/login-use-case.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/base-use-case.dart';


import '../../../mocks/mock-generator.mocks.dart';




void main() {
  late MockAuthRepository repository;
  late User user;
  late UserCompany tCompany;
  late LoginUseCase useCase;
  late String validLoginNumber;
  late String nonValidLoginNumber;
  late int validLoginOtp;
  late int nonValidLoginOtp;
  setUp(() {
    repository = MockAuthRepository();
    useCase     = LoginUseCase(repository);

    validLoginOtp    = 123456;
    validLoginNumber = '+21632154';
     nonValidLoginNumber= 'sdfscwxc';
     nonValidLoginOtp = 4521345646511572992;
    tCompany    =  const UserCompany(
      phoneNumber: '+21655543440',
      name: 'terrific Ventures',
      isArchived: false,
      id: 's56d4f6sd4f',
      commercialLicence: 'commercialLicence.jpeg',
      companyAdminName: ['ali'],
      contactEmail: 'hi@mail.com',
      internalComment:'internalComment.jpeg',
      location: 'Habib Karwi street, Manzah19',
      logo: 'logo.jpeg',
      telephone: '+21697999000',
      vatNumber: 'vatNumber.jpeg',
    );

    user = User(
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


  group('testing login Use Case', () {
    test(
        'should return a user when login useCase is called on valid params',
            () async {
          // arrange
          when(repository.login(number: validLoginNumber,otp: validLoginOtp))
              .thenAnswer((realInvocation) async => Right(user));

          // act
          final result = await useCase(Params.login(login: validLoginNumber, otp: validLoginOtp));

          // assert
          expect(result, Right(user));
          verify(repository.login(number: validLoginNumber,otp: validLoginOtp));
          verifyNoMoreInteractions(repository);
        });

    test(
        'should return a ValidationFailure when login useCase is called on nonValid params',
            () async {
          // act
          final result = await useCase(Params.login(login: nonValidLoginNumber, otp: nonValidLoginOtp));
          //debugPrint(result.toString());
          // assert
          expect(result.isLeft(),true);
          verifyNever(repository.login(number: nonValidLoginNumber,otp: nonValidLoginOtp));
         verifyZeroInteractions(repository);
        });

  });

}
