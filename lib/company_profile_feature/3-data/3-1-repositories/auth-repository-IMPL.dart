
import 'package:dartz/dartz.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.3-repository/auth-repository.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';

class AuthRepositoryIMPL implements AuthRepository{
  @override
  Future<String> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, User>> login({String? number, int? otp}) {
    // TODO: implement login
    throw UnimplementedError();
  }

}