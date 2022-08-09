
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

// interface

abstract class AuthLocalDataSource {
  /*-----------------cached Tokens-------------------*/

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setTokens(KeyStorage collectionName, String token);

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setUser(KeyStorage collectionName, Map<String,dynamic>user,);

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
  @override
  Future<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> setTokens(KeyStorage collectionName, String token) {
    // TODO: implement setTokens
    throw UnimplementedError();
  }

  @override
  Future<void> setUser(KeyStorage collectionName, Map<String,dynamic>user) {
    // TODO: implement setUser
    throw UnimplementedError();
  }

  @override
  Future<String> clearCollection(KeyStorage collectionName) {
    // TODO: implement clearCollection
    throw UnimplementedError();
  }

}