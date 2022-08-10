

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.2-screens/login-screen.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.2-use-cases/login-use-case.dart';

import '../../../core/utils/base-use-case.dart';

class AuthViewModel extends ChangeNotifier{
  final LoginUseCase useCase;

  AuthViewModel({required this.useCase});
  bool isIndicatorLoading=false;

  String? loginNumber;
  int? otp;
 void setLoginNumber(String val){
   loginNumber=val;
   notifyListeners();
 }
 void setOtp(int val){
   otp=val;
 }
  Future<Either<LoginFails,LoginSuccess>> login( ) async {
    isIndicatorLoading = true;
    notifyListeners();
    final result = await useCase(Params.login(login: loginNumber, otp: otp));
    isIndicatorLoading= false;
    notifyListeners();

    return result.fold(
      (l) {
        debugPrint('${l.properties[0]} login fails for the reason +++'); // failure message
        return Left(LoginFails(l.properties[0]));
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
  String errorMessage;
  LoginFails(this.errorMessage);
}