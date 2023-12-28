// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customers.g.dart';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

@JsonSerializable()
class Customers extends Equatable {
  const Customers(
      {required this.firstName,
      required this.lastName,
      required this.imageUrl,
      required this.id});

  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'id')
  final int id;

  factory Customers.fromJson(final Map<String, dynamic> json) {
    return _$CustomersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomersToJson(this);

  @override
  List<Object?> get props => [];
}
