import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.3-data-sources/remote-data-source/auth-remote-data-source.dart';
import 'package:terrific_venture_assessment/core/utils/networking/network_info.dart';

import '../../lib/auth_feature/2-domain/2.3-repository/auth-repository.dart';


@GenerateMocks([AuthRepository])
@GenerateMocks([AuthLocalDataSource])
@GenerateMocks([AuthRemoteDataSource])
@GenerateMocks([NetworkInfo])
@GenerateMocks([InternetConnectionChecker])
@GenerateMocks([SharedPreferences])
@GenerateMocks([Dio])
void main(){}