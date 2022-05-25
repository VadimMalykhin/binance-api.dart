// ignore_for_file: avoid_print

import 'dart:io' show Platform;

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final envVars = Platform.environment;

  final api = BinanceApiSpot()
    ..withCredentials(
      apiKey: envVars['BINANCE_API_KEY'] ?? '',
      apiSecret: envVars['BINANCE_API_SECRET'] ?? '',
    );

  try {
    final apiRestrictions = await api.apiRestrictions();
    print(apiRestrictions.toJson());
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
