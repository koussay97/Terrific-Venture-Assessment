import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';

abstract class BaseUseCase<Type,Params>{
  Future<Either<Failures,Type>>call(Params params);
}

class Params extends Equatable{
   String? login;
   int? otp;
   Map<String,dynamic>? data;
  Params.login( {required this.login,required this.otp});
  Params.data({required this.data});
  Params.nullParams();

  @override
  List<Object?> get props => [login, otp, data];
}