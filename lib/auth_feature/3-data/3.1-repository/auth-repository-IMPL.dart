import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.1-entities/user.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.3-repository/auth-repository.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.2-models/user-model.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/remote-data-source/auth-remote-data-source.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';
import 'package:terrific_venture_assessment/core/errors/failures/failures.dart';
import 'package:terrific_venture_assessment/core/utils/networking/network_info.dart';

class AuthRepositoryIMPL implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryIMPL(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<CacheFailures, String>> logOut() async {
    try {
       await localDataSource.getAccessToken();
       // this might be redundant because if no token found localDataSource.clearCollection will throw an exception
       // but calling the getToken method gives us more security
        return Right(
            await localDataSource.clearCollection(KeyStorage.accessToken));
    } catch (e) {
      return const Left(CacheFailures(properties: 'no Token Found'));
    }
  }

  @override
  Future<Either<Failures, User>> login({String? number, int? otp}) async {
    bool connected = await networkInfo.isConnected;
    if (connected) {
      try {
        var result = await remoteDataSource.login(number!, otp!);
        await localDataSource.setUser(
            KeyStorage.user, UserModel.toJson(result));
        return Right(result);
      } catch (e) {
        return Left(await Future.value(const ServerFailures(
            properties: ['login cardinals are not correct'])));
      }
    }
    return const Left(ServerFailures(properties: [
      'you lost internet connection please verify your network'
    ]));
  }
}
