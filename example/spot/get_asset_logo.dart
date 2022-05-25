// ignore_for_file: avoid_print

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final api = BinanceApiSpot()..setDebug(true);

  try {
    final getAssetLogo = await api.getAssetLogo();
    for (final element in getAssetLogo) {
      print(element.toJson());
    }
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
