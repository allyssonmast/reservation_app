import 'dart:convert';

import 'package:chopper/chopper.dart';

import '../modules/tables/domain/models/index.dart';


class CustomJsonConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    const contentType = 'application/json';
    return request.copyWith(headers: {'Content-Type': contentType});
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
    Response response,
  ) {
    final contentType = response.headers['content-type'];
    final decodedJson = json.decode(response.bodyString);

    if (contentType?.contains('json') == true) {
      if (decodedJson is List) {
        // Verifique se a resposta é uma lista e, em seguida, escolha o tipo de entidade
        if (decodedJson.isNotEmpty && decodedJson[0].containsKey('shape')) {
          // Aqui, assumimos que é uma lista de Tables
          final List<Tables> tablesList =
              decodedJson.map((json) => Tables.fromJson(json)).toList();
          return response.copyWith<BodyType>(body: tablesList as BodyType);
        } else if (decodedJson.isNotEmpty &&
            decodedJson[0].containsKey('user_id')) {
          // Assumindo que é uma lista de Reservations
          final List<Reservation> reservationsList =
              decodedJson.map((json) => Reservation.fromJson(json)).toList();
          return response.copyWith<BodyType>(
              body: reservationsList as BodyType);
        } else if (decodedJson.isNotEmpty &&
            decodedJson[0].containsKey('first_name')) {
          // Assumindo que é uma lista de Customers
          final List<Customers> customersList =
              decodedJson.map((json) => Customers.fromJson(json)).toList();
          return response.copyWith<BodyType>(body: customersList as BodyType);
        }
      } else {
        // Lidar com outras situações se necessário
      }
    }

    return response.copyWith<BodyType>(body: decodedJson as BodyType);
  }
}
