
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reservations.g.dart';

Reservation reservationFromJson(String str) => Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

@JsonSerializable()
class Reservation extends Equatable{
 const Reservation({
    required this.userId,
    required this.tableId,
    required this.id,
  });

 @JsonKey(name: 'user_id')
 final int userId;
 @JsonKey(name: 'table_id')
  final int tableId;
 @JsonKey(name: 'id')
  final int id;

  @override
  List<Object?> get props => [];

 factory Reservation.fromJson(final Map<String, dynamic> json) {
   return _$ReservationFromJson(json);
 }

 Map<String, dynamic> toJson() => _$ReservationToJson(this);
}