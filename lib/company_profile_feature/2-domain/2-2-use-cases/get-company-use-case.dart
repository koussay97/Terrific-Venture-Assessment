

import 'package:dartz/dartz.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-1-entities/company.dart';
import 'package:terrific_venture_assessment/company_profile_feature/2-domain/2-3-repositories/company-repository.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/base-use-case.dart';

class GetCompanyUseCase implements BaseUseCase<UserCompany, Params> {

  final CompanyRepository companyRepository;

  GetCompanyUseCase({required this.companyRepository});

  @override
  Future<Either<Failures, UserCompany>> call(Params params) async {
  return await companyRepository.getCompany();
  }
}
