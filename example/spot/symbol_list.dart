// ignore_for_file: avoid_print

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final api = BinanceApiSpot()..setDebug(true);

  try {
    final symbolsList = await api.symbolsList();
    for (final entry in symbolsList) {
      print(entry.toJson());
    }
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
