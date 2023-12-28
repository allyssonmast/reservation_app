// app_module.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_mobile_engineer/app/data/restaurant_api.dart';
import 'package:injectable/injectable.dart';
import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/constants/credential.dart';
import 'model_converter.dart';

@module
abstract class AppModule {

  @lazySingleton
  RestaurantApi get restaurantApi;

  @lazySingleton
  ChopperClient get chopperClient => ChopperClient(
    baseUrl: Uri.parse(BASE_URL),
    interceptors: [
      const HeadersInterceptor({'Cache-control': 'no-cache', }),
      HttpLoggingInterceptor(),
    ],
    converter: CustomJsonConverter(),
  );

  @lazySingleton
  JsonConverter get jsonConverter => const JsonConverter();

  @lazySingleton
  Connectivity get connectivity =>Connectivity();

  @lazySingleton
  Logger get logger => Logger();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
