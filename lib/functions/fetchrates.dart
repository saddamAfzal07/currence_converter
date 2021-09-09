import 'package:currence_converter/Model/allcurriencies.dart';
import 'package:currence_converter/Model/ratesfetch.dart';
import 'package:currence_converter/constant/key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchrates() async {
  var respone = await http.get(Uri.parse(
      "https://openexchangerates.org/api/latest.json?base=USD&app_id=" + key));
  final ratesModel = ratesModelFromJson(respone.body);
  return ratesModel;
}

// Future<Map> fetchcurriencies() async {
//   var respone = await http.get(
//       Uri.parse("https://openexchangerates.org/api/latest.json?app_id=" + key));
//   final allCurrencies = allCurrenciesFromJson(respone.body);
//   return allCurrencies;
// }
Future<Map> fetchcurrencies() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

//USD to Any

String convertusd(Map exchangeRates, String usd, String? currency) {
  String output =
      ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
          .toString();
  return output;
}

//Any to Any
String convertAny(Map exchangeRates, String amount, String? currencybase,
    String? currencyfinal) {
  String output = (double.parse(amount) /
          exchangeRates[currencybase] *
          exchangeRates[currencyfinal])
      .toStringAsFixed(2)
      .toString();

  return output;
}
