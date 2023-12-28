// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      userId: json['user_id'] as int,
      tableId: json['table_id'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'table_id': instance.tableId,
      'id': instance.id,
    };
