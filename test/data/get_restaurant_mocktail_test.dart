import 'dart:convert';

import 'package:flutter_mobile_engineer/app/data/restaurant_api.dart';
import 'package:flutter_mobile_engineer/app/data/restaurant_repository.dart';
import 'package:flutter_mobile_engineer/app/data/restaurante_repository_I.dart';
import 'package:flutter_mobile_engineer/app/modules/tables/domain/models/index.dart';
import 'package:flutter_mobile_engineer/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../fixtures/fixture_reader.dart';

class MockClientHttp extends Mock implements http.Client {}

void main() {
  late http.Client httpClient;
  late IRestaurantRepository repository;

  setUp(() {
    registerFallbackValue(Uri.parse(''));
    httpClient = MockClientHttp();
    repository = RestaurantRepository(getIt<RestaurantApi>());
  });

  test('description', () async {

    var body = json.decode(fixture('reservation.json'));

    List<Reservation> list = List<Reservation>.from(
        body.map((model) => Reservation.fromJson(model)));

    when(() => httpClient.get(any()))
        .thenAnswer((_) async => http.Response(json.encode(body), 200));

    final respose = await repository.getReservations();

    expect(respose, list);
  });
}
