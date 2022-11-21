import 'package:flutter_mobile_engineer/app/modules/home/models/customers.dart';
import 'package:flutter_mobile_engineer/app/modules/home/models/reservations.dart';
import 'package:flutter_mobile_engineer/app/modules/home/models/tables.dart';

abstract class IRestaurantRepository {
  Future<List<Tables>> getTables();
  Future<List<Customers>> getCustomers();
  Future<List<Reservation>> getReservations();
}
