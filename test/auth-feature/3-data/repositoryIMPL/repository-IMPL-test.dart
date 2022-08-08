
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-1-repositories/auth-repository-IMPL.dart';
import '../../../mocks/mock-generator.mocks.dart';
main(){
  late AuthRepositoryIMPL repository;
  late MockAuthRemoteDataSource remoteDataSource;
  late MockAuthLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;
  setUp(() {
    repository= AuthRepositoryIMPL();

  });

  group('testing repository Impl' , () {

  });

}