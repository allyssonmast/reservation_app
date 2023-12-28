import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import '../modules/tables/domain/models/customers.dart';
import '../modules/tables/domain/models/reservations.dart';
import '../modules/tables/domain/models/tables.dart';

part 'restaurant_api.chopper.dart';

@ChopperApi(baseUrl: '/quandoo-assessment')
abstract class RestaurantApi extends ChopperService {
  @Get(path: 'customers.json')
  Future<Response<List<Customers>>> getCustomers();

  @Get(path: 'reservations.json')
  Future<Response<List<Reservation>>> getReservations();

  @Get(path: 'tables.json')
  Future<Response<List<Tables>>> getTables();

  static RestaurantApi create([ChopperClient? client]) =>
      _$RestaurantApi(client ?? ChopperClient());

  @factoryMethod
  static RestaurantApi createWithConverter(
      ChopperClient client, JsonConverter converter) {
    return _$RestaurantApi(client);
  }
}
