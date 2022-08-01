import 'dart:convert';
import 'package:template/core/services/bool_parser_services.dart';

int parseInt(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key) || json[key] == null) {
    return 0;
  } else {
    return int.tryParse(json[key].toString()) ?? 0;
  }
}

String parseString(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key) || json[key] == null) {
    return '';
  } else {
    return json[key].toString();
  }
}

double parseDouble(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key) || json[key] == null) {
    return 0.0;
  } else {
    return double.tryParse(json[key].toString()) ?? 0.0;
  }
}

bool? parseBool(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key) || json[key] == null) {
    return false;
  } else {
    return Bool.parse(json[key]);
  }
}

Map<String, dynamic> parseJWT(String token) {
  final parts = token.split('.');
  if (parts.length != 3) throw Exception('Invalid token');
  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) throw Exception('Invalid payload');

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
