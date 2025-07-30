import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ToStringConverter implements JsonConverter<String, Object> {
  const ToStringConverter();

  @override
  String fromJson(Object input) {
    return input.toString();
  }

  @override
  String toJson(String input) {
    return input;
  }
}

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    } else if (json is DateTime) {
      return json;
    } else {
      throw FormatException("Invalid timestamp format: $json");
    }
  }

  @override
  dynamic toJson(DateTime date) => Timestamp.fromDate(date);
}
