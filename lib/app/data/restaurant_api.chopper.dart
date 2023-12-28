// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$RestaurantApi extends RestaurantApi {
  _$RestaurantApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestaurantApi;

  @override
  Future<Response<List<Customers>>> getCustomers() {
    final Uri $url = Uri.parse('/quandoo-assessment/customers.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Customers>, Customers>($request);
  }

  @override
  Future<Response<List<Reservation>>> getReservations() {
    final Uri $url = Uri.parse('/quandoo-assessment/reservations.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Reservation>, Reservation>($request);
  }

  @override
  Future<Response<List<Tables>>> getTables() {
    final Uri $url = Uri.parse('/quandoo-assessment/tables.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Tables>, Tables>($request);
  }
}
