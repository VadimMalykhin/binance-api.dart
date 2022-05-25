// ignore_for_file: avoid_print

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final api = BinanceApiSpot()..setDebug(true);

  try {
    final exchangeInfo = await api.exchangeInfo();

    for (final item in exchangeInfo.symbols) {
      print({
        'symbol': item.symbol,
        'baseAsset': item.baseAsset,
        'quoteAsset': item.quoteAsset,
        'status': item.status,
      });
    }
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
