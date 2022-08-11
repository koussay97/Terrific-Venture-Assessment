

import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

import '../../3-2-models/comapny-model.dart';

abstract class CompanyRemoteDataSource{


  /// on any [Exception] throws a [ServerExceptions]
  Future<CompanyModel> getCompany();

}

class CompanyRemoteDataSourceIMPL implements CompanyRemoteDataSource{



  @override
  Future<CompanyModel> getCompany() {
    // TODO: implement getCompany
    throw UnimplementedError();
  }
}