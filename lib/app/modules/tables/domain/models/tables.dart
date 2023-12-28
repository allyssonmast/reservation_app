import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:equatable/equatable.dart';

part 'tables.g.dart';

@JsonSerializable()
class Tables extends Equatable {
  const Tables({
    required this.shape,
    required this.id,
  });
  @JsonKey(name: 'shape')
  final String shape;
  @JsonKey(name: 'id')
  final int id;

  factory Tables.fromJson(final Map<String, dynamic> json) {
    return _$TablesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TablesToJson(this);

  @override
  List<Object?> get props => [];
}

Tables tableFromJson(String str) => Tables.fromJson(json.decode(str));

String tableToJson(Tables data) => json.encode(data.toJson());
