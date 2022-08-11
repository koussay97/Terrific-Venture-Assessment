

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.2-screens/login-screen.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.2-use-cases/login-use-case.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';

import '../../../core/utils/base-use-case.dart';

class AuthViewModel extends ChangeNotifier{
  final LoginUseCase useCase;

  AuthViewModel({required this.useCase});
  bool isIndicatorLoading=false;

  String? loginNumber;
  String? otp;

 void setLoginNumber(String val){
   loginNumber=val;
   notifyListeners();
 }
 void setOtp(String val){

   otp=val;
   notifyListeners();
 }
  Future<Either<LoginFails,LoginSuccess>> login() async {
    isIndicatorLoading = true;
    notifyListeners();
    Either<Failures, User> result;
   try {
     var otpConv = int.parse(otp!);
     result = await useCase(Params.login(login: loginNumber, otp: otpConv));
     debugPrint(' result $result');
   }catch(e){
     return Left(LoginFails(errorMessage: 'otp must be numbers'));
   }
    isIndicatorLoading= false;
    notifyListeners();

    return result.fold(
      (l)async {
        return await Future.value(Left(LoginFails(errorMessage: l.properties.first??'')));
   /*     debugPrint('accessed left compartment in login vmodel ${l.properties}');
        if(result.isLeft()&& l.properties.isNotEmpty){
        return Left(LoginFails(l.properties[0]));
        }
        return Left(LoginFails('sth went wrong with our left '));*/
        } , // error
      (r) {
        debugPrint('login success ');
        debugPrint(r.toString());
        return Right(LoginSuccess());
        // success data
      } , // success
    );
  }


}
enum LoginState{
  success,
  fail,
  defaultState,
}

class LoginSuccess{}

class LoginFails{
  String? errorMessage;
  LoginFails( {this.errorMessage=''});
}