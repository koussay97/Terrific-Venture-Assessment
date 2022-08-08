import 'package:flutter/material.dart';

abstract class CustomValidator{
  static final RegExp nameRegExp = RegExp(r"^[a-zA-Z]+$");
  static final RegExp numberRegExp = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  static final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp otpRegExp = RegExp(r"^[0-9]+$");

  static Map<String,dynamic> isNameValid(String input){
    Map<String,dynamic> assessment= {"result":false,"message":""};
    if(nameRegExp.hasMatch(input)&& input.length<30 &&input.length>1&&input.isNotEmpty ){
      assessment["result"]=true;
    }else{
      assessment["result"]=false;
      if(input.length>30){
        assessment["message"]="name is too long, length accepted  is 1<length<30 characters";
      }else if(!nameRegExp.hasMatch(input)&&input.isNotEmpty){
        assessment["message"]="a valid name must only contain a-z or A-Z";
      }else if(input.length==1){
        assessment["message"]="name is too short, length accepted  is 1<length<30 characters";
      }else{
        assessment["message"]="can not login with empty fields";
      }
    }
    return assessment;
  }


  static isOtpValid(String otp){
    Map<String,dynamic> assessment= {"result":false,"message":""};
    if(otpRegExp.hasMatch(otp) && otp.length<10 && otp.length>1){
      debugPrint('otp correct');
      assessment["result"]=true;
    }else{
      assessment["result"]=false;
      if(otp.length>10){
        debugPrint('otp >10');
        assessment["message"]="otp is too long, length accepted  is 1<length<10 characters";
      }else if(!otpRegExp.hasMatch(otp)&&otp.isNotEmpty){
        debugPrint('otp not valid format');
        assessment["message"]="a valid otp must only contain 0-9";
      }else if(otp.length==1){
        debugPrint('otp ==1');
        assessment["message"]="otp is too short, length accepted  is 1<length<10 characters";
      }else{
        debugPrint('otp is empty');
        assessment["message"]="can not accept empty fields";
      }
    }
    return assessment;
  }

  static isNumberValid(String number){
    Map<String,dynamic> assessment= {"result":false,"message":""};
    if(numberRegExp.hasMatch(number) && number.length<13 &&number.length>1&&number.isNotEmpty ){
      assessment["result"]=true;
    }else{
      assessment["result"]=false;
      if(number.length>13){
        assessment["message"]="number is too long, length accepted  is 1<length<13 characters";
      }else if(!numberRegExp.hasMatch(number)&&number.isNotEmpty){
        assessment["message"]="a valid name must only contain 0-9";
      }else if(number.length==1){
        assessment["message"]="number is too short, length accepted  is 1<length<13 characters";
      }else{
        assessment["message"]="can not accept with empty fields";
      }
    }
    return assessment;
  }

  static isEmailValid(String email){
    Map<String,dynamic> assessment= {"result":false,"message":""};
    if(numberRegExp.hasMatch(email) && email.length<30 &&email.length>1&&email.isNotEmpty ){
      assessment["result"]=true;
    }else{
      assessment["result"]=false;
      if(!numberRegExp.hasMatch(email)&&email.isNotEmpty){
        assessment["message"]="a valid email must be of form example@mail.domain ";
      }else{
        assessment["message"]="can not accept fields";
      }
    }
    return assessment;
  }
}