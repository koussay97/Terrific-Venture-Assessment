import 'package:dartz/dartz.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';


abstract class CompanyRepository {

  Future<Either<Failures,UserCompany>> getCompany();
  Future<Either<Failures,UserCompany>> updateCompany();
  Future<Either<Failures,UserCompany>> uploadCompanyImage();

}