/// Binance API Exception
///
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md
class BinanceApiBaseException implements Exception {
  final int code;
  final String message;

  BinanceApiBaseException(this.message, this.code);

  @override
  String toString() => 'The Binance API was returned an error: [$code] $message';
}
