import 'dart:convert';

import '../classes/Stock.dart';

import 'package:http/http.dart' as http;

Future<List<Stock>> getPopularStocks() async {
  final response = await http.get(Uri.https(
    'cloud.iexapis.com',
    'stable/stock/market/list/mostactive',
    {"token": "pk_1531642170424a7f9d6f60996dd42df6", "displayPercent": "true"},
  ));

  if (response.statusCode == 200) {
    print("Fetched popular stock");
    return parsePopularStocks(response.body);
  } else {
    throw Exception('Failed to load Stocks');
  }
}

List<Stock> parsePopularStocks(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Stock>((json) => Stock.fromJson(json)).toList();
}

Future<List<Stock>> searchStocksAPI(String searchQuery) async {
  final response = await http.get(Uri.https(
    'alphavantage.co',
    'query?function=$searchQuery',
    {"token": "EQ29UXPKD2W8X0DZ"},
  ));

  print(response.body.toString());
  if (response.statusCode == 200) {
    print("Fetched popular stock");
    return searchResults(response.body);
  } else {
    throw Exception('Failed to load Stocks');
  }
}

List<Stock> searchResults(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Stock>((json) => Stock.fromJson(json)).toList();
}
