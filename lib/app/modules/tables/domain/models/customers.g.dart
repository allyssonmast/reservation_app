// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customers _$CustomersFromJson(Map<String, dynamic> json) => Customers(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      imageUrl: json['image_url'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CustomersToJson(Customers instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'image_url': instance.imageUrl,
      'id': instance.id,
    };
