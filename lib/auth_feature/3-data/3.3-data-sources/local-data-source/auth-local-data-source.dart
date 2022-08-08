
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

// interface

abstract class AuthLocalDataSource {
  /*-----------------cached Tokens-------------------*/

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setTokens(KeyStorage collectionName, String accessToken,String refreshToken);

  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setUser(KeyStorage collectionName, String accessToken,String refreshToken);

  /// on any [Exception] throws a [CacheExceptions]
  Future<String> getAccessToken();

  /// on any [Exception] throws a [CacheExceptions]
  Future<String> getRefreshToken();

}

enum KeyStorage {
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
  Future<void> setTokens(KeyStorage collectionName, String accessToken, String refreshToken) {
    // TODO: implement setTokens
    throw UnimplementedError();
  }

  @override
  Future<void> setUser(KeyStorage collectionName, String accessToken, String refreshToken) {
    // TODO: implement setUser
    throw UnimplementedError();
  }

}