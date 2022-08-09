import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {

  Future<Either<Failures,User>> login({ String? number,int? otp});

  Future<Either<Failures,String>> logOut();

  // we can add other use cases such as register and recover password

}