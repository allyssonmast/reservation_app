// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers extends Equatable{
  const Customers({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  final String firstName;
  final String lastName;
  final String imageUrl;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        firstName: json["first_name"],
        lastName: json["last_name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "image_url": imageUrl,
      };

  @override
  List<Object?> get props => [];
}
