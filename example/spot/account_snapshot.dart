// ignore_for_file: avoid_print

import 'dart:io';

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final envVars = Platform.environment;

  final api = BinanceApiSpot()
    ..setDebug(true)
    ..withCredentials(
      apiKey: envVars['BINANCE_API_KEY'] ?? '',
      apiSecret: envVars['BINANCE_API_SECRET'] ?? '',
    );

  try {
    final accountSnapshot = await api.accountSnapshot();
    print(accountSnapshot);
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
