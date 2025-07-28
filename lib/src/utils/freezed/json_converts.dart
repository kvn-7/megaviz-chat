import 'package:freezed_annotation/freezed_annotation.dart';

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
