import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.3-repository/auth-repository.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/base-use-case.dart';
import 'package:terrific_venture_assessment/core/utils/custom-validators/custom_validator.dart';

/*
 * the purpose of logic in useCases is return either success objects or failure objects
 * these objects will be provided to the bloc or change notifier class
 * that will emit states based on the result
 * */

class LoginUseCase implements BaseUseCase<User, Params> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failures, User>> call(Params p) async {
    var validationResult = validLoginParams(p);
    late Either<Failures, User> loginResult;

    await validationResult.fold(
        (l) async => loginResult = await Future.value(Left(l)),
        (r) async =>
            loginResult = await repository.login(number: p.login, otp: p.otp));
    return loginResult;
  }

  // params validation before forwarding the call to the repository

  Either<ValidationFailures, bool> validLoginParams(Params p) {
    var r1 = CustomValidator.isNumberValid(p.login!);
    var r2 = CustomValidator.isOtpValid(p.otp!.toString());

    //debugPrint("${r1["result"] && r2["result"]}----validation result");
    //debugPrint("${p.otp}----params value");
    //debugPrint("${r2["result"]}----validation otp");

    if (r1["result"] && r2["result"]) {
      return const Right(true);
    }
    return Left(ValidationFailures(properties: [r1["message"], r2["message"]]));
  }
}
