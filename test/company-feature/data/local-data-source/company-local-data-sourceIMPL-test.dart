

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-3-data-sources/local-data-source/company-local-data-source.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

import '../../../mocks/mock-generator.mocks.dart';

main(){
  late CompanyLocalDataSourceIMPL localDataSource;
  late MockSharedPreferences sharedPreferences;
  
  
  setUp(() {
    sharedPreferences= MockSharedPreferences();
    localDataSource = CompanyLocalDataSourceIMPL(sharedPreferences: sharedPreferences);
    
  });
  
  group('testing local data source IMPL', () { 
    
    test('should return CacheException when Company was not set in local Storage', () async {
      
      // arrange
      when(sharedPreferences.containsKey(CompanyKeys.company.name)).thenReturn(false);
      // act
      var result;
      try {
         result= await localDataSource.getCompany(CompanyKeys.company);
      }catch(e){
      }// assert

      expect(localDataSource.getCompany(CompanyKeys.company),throwsException);
    });
    

    
  });
}