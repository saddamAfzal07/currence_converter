// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

// Map<String, String> emptyFromJson(String str) =>
//     Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

// String emptyToJson(Map<String, String> data) =>
//     json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));

Map<String, String> allCurrenciesFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allCurrenciesToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
