import 'package:dartz/dartz.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-3-repositories/company-repository.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-3-data-sources/local-data-source/company-local-data-source.dart';
import 'package:terrific_venture_assessment/company_profile_feature/3-data/3-3-data-sources/remote-data-source/company-remote-data-source.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/networking/network_info.dart';

import '../3-2-models/comapny-model.dart';

class CompanyRepositoryIMPL implements CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;
  final CompanyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CompanyRepositoryIMPL(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failures, UserCompany>> getCompany() async {
    var connection = await networkInfo.isConnected;
    if (connection) {
      try {
        var data = await remoteDataSource.getCompany();
        localDataSource.setCompany(
            CompanyKeys.company, CompanyModel.toJson(data));
        return Right(data);
      } catch (e) {
        return const Left(ServerFailures(properties: ['']));
      }
    }
    try {
      return Right(await localDataSource.getCompany(CompanyKeys.company));
    } catch (e) {
      return left(const CacheFailures(properties: []));
    }
  }

  @override
  Future<Either<Failures, UserCompany>> updateCompany() {
    // TODO: implement updateCompany
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, UserCompany>> uploadCompanyImage() {
    // TODO: implement uploadCompanyImage
    throw UnimplementedError();
  }
}
