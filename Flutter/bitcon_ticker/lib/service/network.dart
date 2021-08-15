import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class Network {
  Future<String> getExchangeRateCurrency(String crypto, String currency) async {
    print("crypto : " + crypto);
    print("currency : " + currency);
    http.Response response = await http.get(
        Uri.parse("https://rest.coinapi.io/v1/exchangerate/$crypto/$currency"),
        headers: {"X-CoinAPI-Key": "205873F0-E1B8-4EAB-ACF2-331021A49BBF"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      String value =
          (jsonDecode(response.body)["rate"] as double).toStringAsFixed(2);
      print(value);
      return value;
    }
    return null;
  }
}
