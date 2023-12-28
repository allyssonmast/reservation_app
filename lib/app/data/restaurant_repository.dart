import 'package:flutter_mobile_engineer/app/data/restaurant_api.dart';
import 'package:flutter_mobile_engineer/app/data/restaurante_repository_I.dart';
import '../modules/tables/domain/models/index.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRestaurantRepository)
class RestaurantRepository implements IRestaurantRepository {
  final RestaurantApi _api;

  RestaurantRepository(this._api);

  @override
  Future<List<Customers>> getCustomers() async {
    var response = await _api.getCustomers();

    return response.body ?? [];
  }

  @override
  Future<List<Reservation>> getReservations() async {
    var response = await _api.getReservations();
    return response.body ?? [];
  }

  @override
  Future<List<Tables>> getTables() async {
    var response = await _api.getTables();
    return response.body ?? [];
  }
}
