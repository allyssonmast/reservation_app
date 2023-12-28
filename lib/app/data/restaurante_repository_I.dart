import '../modules/tables/domain/models/index.dart';

abstract class IRestaurantRepository {
  Future<List<Tables>> getTables();
  Future<List<Customers>> getCustomers();
  Future<List<Reservation>> getReservations();
}
