// ignore_for_file: avoid_print

import 'package:binance_api/binance_api.dart';

Future<void> main() async {
  final api = BinanceApiSpot()..setDebug(true);

  try {
    final pingLatency = await api.pingLatency();
    print({
      'elapsed': pingLatency.elapsed,
      'elapsedMilliseconds': pingLatency.elapsedMilliseconds,
      'elapsedTicks': pingLatency.elapsedTicks,
      'frequency': pingLatency.frequency,
    });
  } on BinanceApiBaseException catch (e) {
    print(e);
  }
}
