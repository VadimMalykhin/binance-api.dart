// ignore_for_file: avoid_print

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final api = BinanceApiSpot()..setDebug(true);

  try {
    final ping = await api.ping();
    print(ping);
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
