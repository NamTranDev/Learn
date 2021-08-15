import 'package:bitcoin_ticker/service/network.dart';

import '../coin_data.dart';

class Controller {
  Network network = Network();
  String currentCurrency = currenciesList.first;

  bool updateData(String value) {
    if (value == currentCurrency) return false;
    currentCurrency = value;
    return true;
  }

  Future<Map<String, CoinData>> getData() async {
    Map<String, CoinData> cryptoPrices = {};
    for (String crypto in cryptoList) {
      CoinData coin = CoinData(crypto: crypto, currency: currentCurrency);
      coin.value =
          await network.getExchangeRateCurrency(coin.crypto, coin.currency);
      cryptoPrices[crypto] = coin;
    }

    return cryptoPrices;
  }
}
