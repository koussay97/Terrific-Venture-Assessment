
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';


// interface

abstract class AuthLocalDataSource {
  /*-----------------cached Tokens-------------------*/

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setTokens(KeyStorage collectionName, String token);

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setUser(KeyStorage collectionName, Map<String,dynamic>user,);

  /// on any [Exception] throws a [CacheExceptions]
  Future<Map<String,dynamic>> getUser();

  /// on any [Exception] throws a [CacheExceptions]
  Future<String> getAccessToken();

  /// on any [Exception] throws a [CacheExceptions]
  Future<String> getRefreshToken();

  /// on any [Exception] throws a [CacheExceptions]
  Future<String>clearCollection(KeyStorage collectionName);
}

enum KeyStorage {
  user,
  accessToken,
  refreshToken,
}

// implementation

class AuthLocalDataSourceIMPL implements AuthLocalDataSource{

  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceIMPL({required this.sharedPreferences});

  @override
  Future<String> getAccessToken() async {
   if(sharedPreferences.containsKey(KeyStorage.accessToken.name)){
     var result =  sharedPreferences.getString(KeyStorage.accessToken.name);
     if(result == null|| result.isEmpty){
       throw CacheExceptions('no token found', 'stackTrace');
     }
     return await Future.value(result);
   }
   throw CacheExceptions('token not initialized', 'stackTrace');
  }

  @override
  Future<String> getRefreshToken()async {
    if(sharedPreferences.containsKey(KeyStorage.refreshToken.name)){
      var result =  sharedPreferences.getString(KeyStorage.refreshToken.name);
      if(result == null|| result.isEmpty){
        throw CacheExceptions('no token found', 'stackTrace');
      }
      return await Future.value(result);
    }
    throw CacheExceptions('token not initialized', 'stackTrace');
  }

  @override
  Future<void> setTokens(KeyStorage collectionName, String token) async {
    await sharedPreferences.setString(collectionName.toString(),token);
  }

  @override
  Future<void> setUser(KeyStorage collectionName, Map<String,dynamic>user)async {
    await sharedPreferences.setString(collectionName.toString(),json.encode(user));
  }

  @override
  Future<String> clearCollection(KeyStorage collectionName)async {
    if(sharedPreferences.containsKey(collectionName.name)){
       await sharedPreferences.remove(collectionName.name);
      return '${collectionName.name} is cleared';
       }else{
     throw CacheExceptions('no Token initialized', 'stackTrace');
    }
  }

  @override
  Future<Map<String,dynamic>> getUser() async {
    if(sharedPreferences.containsKey(KeyStorage.user.name)){
      var result =  sharedPreferences.getString(KeyStorage.user.name);
      if(result == null|| result.isEmpty){
        throw CacheExceptions('no user found', 'stackTrace');
      }
      return await Future.value(json.decode(result));
    }
    throw CacheExceptions('user not initialized', 'stackTrace');
  }

}