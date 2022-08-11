import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:terrific_venture_assessment/core/errors/failures/exceptions.dart';

import '../../3-2-models/comapny-model.dart';

abstract class CompanyLocalDataSource {
  /// on any [Exception] throws a [CacheExceptions]
  Future<void> setCompany(
      CompanyKeys collectionName, Map<String, dynamic> data);

  /// on any [Exception] throws a [CacheExceptions]
  Future<CompanyModel> getCompany(
    CompanyKeys collectionName,
  );

  /// on any [Exception] throws a [CacheExceptions]
  Future<String> clearCompanyCollection(CompanyKeys collectionName);
}

enum CompanyKeys {
  company,
}

class CompanyLocalDataSourceIMPL implements CompanyLocalDataSource {
  final SharedPreferences sharedPreferences;

  CompanyLocalDataSourceIMPL({required this.sharedPreferences});

  @override
  Future<String> clearCompanyCollection(CompanyKeys collectionName) {
    // TODO: implement clearCompanyCollection
    throw UnimplementedError();
  }

  @override
  Future<CompanyModel> getCompany(CompanyKeys collectionName) async {
    if (!sharedPreferences.containsKey(collectionName.name)) {
      throw CacheExceptions('message', 'stackTrace');
    }
    var model = sharedPreferences.getString(collectionName.name);

    if (model != null) {
      return await Future.value(CompanyModel.fromJson(json.decode(model)));
    }
    throw CacheExceptions('message', 'stackTrace');
  }

  @override
  Future<void> setCompany(
      CompanyKeys collectionName, Map<String, dynamic> data) {
    // TODO: implement setCompany
    throw UnimplementedError();
  }
}
