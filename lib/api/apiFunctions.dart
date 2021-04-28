import 'dart:developer';

import 'package:http/http.dart' as http;

void getPopularStocks() async {
  final response = await http.get(Uri.https(
      'cloud.iexapis.com',
      'stable/stock/market/list/mostactive',
      {"token": "pk_1531642170424a7f9d6f60996dd42df6"}));

  if (response.statusCode == 200) {
    print("success");
    print(response.body.toString());
  } else {
    print('fail');
    print(response.body.toString());

    throw Exception('Failed to load album');
  }
}
