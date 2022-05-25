import 'package:binance_api/binance_api.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final api = BinanceApiSpot();
  group('Spot', () {
    test('ping', () async {
      final value = await api.ping();
      expect(value, equals(true));
    });

    test('ping latency', () async {
      final value = await api.pingLatency();
      expect(value, isNotNull);
    });
  });
}
