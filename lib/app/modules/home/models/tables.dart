

import 'dart:convert';

import 'package:equatable/equatable.dart';

Table tableFromJson(String str) => Table.fromJson(json.decode(str));

String tableToJson(Table data) => json.encode(data.toJson());

class Table extends Equatable{
 const Table({
    required this.shape,
    required this.id,
  });

  final String shape;
  final int id;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    shape: json["shape"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "shape": shape,
    "id": id,
  };

  @override
  List<Object?> get props => [];
}
